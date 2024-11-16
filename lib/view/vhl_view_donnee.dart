import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:katec/controllers/test_getx_controller.dart';
import 'package:katec/sqldb.dart';

class VhlViewDonnee extends StatefulWidget {
  const VhlViewDonnee({super.key});

  @override
  State<VhlViewDonnee> createState() => _VhlViewDonneeState();
}

SqlDb sqlDb = SqlDb();

List data = [];
Future<List> getList() async {
  List response = await sqlDb.readData(
      '''SELECT categories.id,categories.nomCategorie ,count(vhls.matricule) AS Nb
FROM categories
JOIN vhls
ON vhls.categorie_id=categories.id
GROUP BY nomCategorie
ORDER BY categories.id ''');
  print(response);
  data.addAll(response);
  return response;
}

class _VhlViewDonneeState extends State<VhlViewDonnee> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(6), children: [
      Text("${Get.arguments[0]['marque']}"),
      Text("${Get.arguments[0]['agence_id']}"),
      MaterialButton(
          child: Text("Test"),
          onPressed: () {
            getList();
          }),
      GetBuilder<TestGetxController>(
          init: TestGetxController(),
          builder: (controller) => Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      controller.icrementer();
                    },
                  ),
                  Text("${controller.counter}"),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.decrementer();
                    },
                  ),
                ],
              ))
    ]);
  }
}
