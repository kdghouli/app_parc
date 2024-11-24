import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:katec/helpers/sqldb.dart';
import 'package:katec/widget/icons_parc.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  SqlDb db = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
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
      backgroundColor: Colors.teal,
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.amber[200],
        child: Column(children: [
          const Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                IconsParc(
                    textIco: "Distribution",
                    ikon: Icon(Icons.local_shipping),
                    page: "camionview"),
                IconsParc(
                    textIco: "Voiture",
                    ikon: Icon(Icons.directions_car),
                    page: "voitureview")
              ])),
          const Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                IconsParc(
                    textIco: "Chariots",
                    ikon: Icon(Icons.forklift),
                    page: "camionview"),
                IconsParc(
                    textIco: "Scooter",
                    ikon: Icon(Icons.delivery_dining),
                    page: "camionview")
              ])),
          const Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                IconsParc(
                    textIco: "Users",
                    ikon: Icon(Icons.admin_panel_settings),
                    page: "camionview"),
                IconsParc(
                    textIco: "Table de bord",
                    ikon: Icon(Icons.dashboard),
                    page: "camionview")
              ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                  onPressed: () {
                    db.supprimerDb();
                  },
                  color: Colors.blueAccent,
                  child: const Text("Réinialisation")),
              MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: () async {
                    print("sava");
                    //await db.getDbPath();
                    await db.backupDb();
                  },
                  child: Text("BackUp")),
              MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: () async {
                    //await db.getDbPath();
                    await db.restoreDb();
                  },
                  child: Text("Restore")),
            ],
          )
        ]),
      ),
    );
  }
}
