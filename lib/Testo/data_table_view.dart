import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/getx_controller.dart';

class DataTableView extends StatelessWidget {
  DataTableView({super.key});

  final controller = Get.put(TestGetxController());
  @override
  Widget build(BuildContext context) {
    controller.getRecapCatego();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Tableau de bord"),
          backgroundColor: Colors.yellowAccent,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed("parametreview");
                },
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ))
          ],
        ),
        backgroundColor: Colors.teal[400],
        body: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                "55",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Designation',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Mohit')),
                DataCell(Text('23')),
                DataCell(Text('Associate Software Developer')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Akshay')),
                DataCell(Text('25')),
                DataCell(Text('Software Developer')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Deepak')),
                DataCell(Text('29')),
                DataCell(Text('Team Lead ')),
              ],
            ),
          ],
        ));
  }
}
