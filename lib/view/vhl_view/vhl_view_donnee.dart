import 'package:flutter/material.dart';
import 'package:app_parc/helpers/sqldb.dart';
import 'package:app_parc/widget/casier_custum.dart';

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
        Container(
            height: 300,
            margin: EdgeInsets.all(10),
            child: PageView(
              children: [
                Image.asset(
                  "assets/images/a.jpeg",
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/images/aa.jpeg",
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/images/b.jpeg",
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/images/d.jpeg",
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/images/h.png",
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/images/k.jpeg",
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                ),
              ],
            )),
      ])
    ]);
  }
}
