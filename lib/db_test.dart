import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

import 'package:file_picker/file_picker.dart';





class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message),
            ElevatedButton(
              onPressed: () async {
                final dbFolder = await getDatabasesPath();
                File source1 = File('$dbFolder/mmr.db');

                Directory copyTo =
                    Directory("storage/emulated/0/Sqlite Backup");
                if ((await copyTo.exists())) {
                   print("Path exist");
                  var status = await Permission.storage.status;
                  if (!status.isGranted) {
                    await Permission.storage.request();
                  }
                } else {
                  print("not exist");
                  if (await Permission.storage.request().isGranted) {
                    // Either the permission was already granted before or the user just granted it.
                    await copyTo.create();
                  } else {
                    print('Please give permission');
                  }
                }

                String newPath = "${copyTo.path}/mmr.db";
                await source1.copy(newPath);

                setState(() {
                  message = 'Successfully Copied DB';
                });
              },
              child: const Text('Copy DB'),
            ),
            ElevatedButton(
              onPressed: () async {
                var databasesPath = await getDatabasesPath();
                var dbPath = join(databasesPath, 'mmr.db');
                await deleteDatabase(dbPath);
                setState(() {
                  message = 'Successfully deleted DB';
                });
              },
              child: const Text('Delete DB'),
            ),
            ElevatedButton(
              onPressed: () async {
                var databasesPath = await getDatabasesPath();
                var dbPath = join(databasesPath, 'mmr.db');

                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  File source = File(result.files.single.path!);
                  await source.copy(dbPath);
                  setState(() {
                    message = 'Successfully Restored DB';
                  });
                } else {
                  // User canceled the picker
                }
              },
              child: const Text('Restore DB'),
            ),
          ],
        ),
      ),
    );
  }
}
