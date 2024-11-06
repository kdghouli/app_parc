import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:katec/sqldb.dart';
import 'package:katec/widget/icons_parc.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  SqlDb db = SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home page"),
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
      backgroundColor: Colors.tealAccent,
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.amber[200],
        child: Column(children: [
          const Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                IconsParc(
                    textIco: "distribution", ikon: Icon(Icons.local_shipping)),
                IconsParc(textIco: "voiture", ikon: Icon(Icons.directions_car))
              ])),
          const Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                IconsParc(textIco: "Chariots", ikon: Icon(Icons.forklift)),
                IconsParc(textIco: "Scooter", ikon: Icon(Icons.delivery_dining))
              ])),
          const Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                IconsParc(
                    textIco: "Users", ikon: Icon(Icons.admin_panel_settings)),
                IconsParc(textIco: "Table de bord", ikon: Icon(Icons.dashboard))
              ])),
          Container(
              child: MaterialButton(
                  onPressed: () {
                    db.supprimerDb();
                  },
                  child: const Text("Réinialisation"))),
        ]),
      ),
    );
  }
}