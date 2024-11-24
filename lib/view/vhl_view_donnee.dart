import 'package:flutter/material.dart';
import 'package:katec/helpers/sqldb.dart';
import 'package:katec/widget/casier_custum.dart';

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
        CasierCustum(nameCase: "Chassis :", nameCaseBase: "chassis"),
        CasierCustum(nameCase: "Intitule :", nameCaseBase: "Intitule"),
      ])
    ]);
  }
}
