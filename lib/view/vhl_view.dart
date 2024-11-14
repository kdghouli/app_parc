import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:katec/controllers/test_getx_controller.dart';
import 'package:katec/sqldb.dart';

class VhlView extends StatefulWidget {
  const VhlView({super.key});

  @override
  State<VhlView> createState() => _VhlViewState();
}

SqlDb sqlDb = SqlDb();

List data = [];

class _VhlViewState extends State<VhlView> {

  int currentPageIndex = 0;
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
    setState(() {});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: "Donnèes",
                ),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "Hist"),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt), label: "Papiers"),
          ],
          backgroundColor: Colors.blueGrey,
        ),
        appBar: AppBar(
            title: Text(
              "${Get.arguments[0]['matricule']}",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.deepOrange,
                  fontSize: 28),
            ),
            backgroundColor: Colors.grey[400],
            shadowColor: Colors.tealAccent),
        body: ListView(padding: EdgeInsets.all(6), children: [
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
        ]));
  }
}
