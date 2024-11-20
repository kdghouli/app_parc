import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katec/controllers/test_getx_controller.dart';
import 'package:katec/helpers/sqldb.dart';

class VhlViewDonnee extends StatefulWidget {
  const VhlViewDonnee({super.key});

  @override
  State<VhlViewDonnee> createState() => _VhlViewDonneeState();
}

SqlDb sqlDb = SqlDb();

List data = [];

class _VhlViewDonneeState extends State<VhlViewDonnee> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(6), children: [
      Column(children: [
        Row(children: [
          Expanded(child: Text("Marque :")),
          Expanded(flex: 2, child: Text("${Get.arguments[0]['marque']}")),
        ]),
        Row(children: [
          Expanded(child: Text("Catégorie:")),
          Expanded(flex: 2, child: Text("${Get.arguments[0]['Catègorie']}")),
        ]),
        Row(
          children: [
            Expanded(child: Text("Affectation :")),
            Expanded(
                flex: 2, child: Text("${Get.arguments[0]['Affectation']}")),
          ],
        ),
      ])
    ]);
  }
}
