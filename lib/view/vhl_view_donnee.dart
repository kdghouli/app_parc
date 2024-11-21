import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katec/controllers/test_getx_controller.dart';
import 'package:katec/helpers/sqldb.dart';
import 'package:katec/widget/casie_custum.dart';

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
        CasierCustum(nameCase: "Marque :", nameCaseBase: "marque"),
        CasierCustum(nameCase: "Catégorie :", nameCaseBase: "Catègorie"),
        CasierCustum(nameCase: "Affectation :", nameCaseBase: "Affectation"),
        Container(
          margin: EdgeInsets.all(1),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.2),
              boxShadow: [
                BoxShadow(
                    offset: Offset(1.2, 1.2),
                    color: Colors.grey,
                    blurRadius: 1.0)
              ],
              gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 163, 223, 217),
                const Color.fromARGB(255, 111, 243, 230),
              ])),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                "Intitule :",
                style: TextStyle(color: Colors.grey[700]),
              )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "${Get.arguments[0]['Intitule']}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        )
      ])
    ]);
  }
}
