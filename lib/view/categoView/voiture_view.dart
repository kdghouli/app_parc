import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:katec/controllers/test_getx_controller.dart';
import 'package:katec/helpers/sqldb.dart';

class VoitureView extends StatefulWidget {
  const VoitureView({super.key});

  @override
  State<VoitureView> createState() => _VoitureViewState();
}

TestGetxController controller = Get.put(TestGetxController());

class _VoitureViewState extends State<VoitureView> {
  @override
  Widget build(BuildContext context) {
    controller.getVhlsCategorie(2);
    var borderRadius = const BorderRadius.only(
        topRight: Radius.circular(3), bottomRight: Radius.circular(3));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Liste des camions"),
          backgroundColor: Colors.grey,
        ),
        body: GetBuilder<TestGetxController>(
          builder: (controller) => SingleChildScrollView(
              child: Column(children: [
            ListView.builder(
                padding: const EdgeInsets.all(3),
                shrinkWrap: true,
                itemCount: controller.data.length,
                itemBuilder: (context, i) {
                  return Card(
                    margin: EdgeInsets.all(2),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: borderRadius),
                      leading: const Icon(
                        Icons.directions_car,
                        color: Colors.redAccent,
                        size: 26,
                      ),
                      dense: true,
                      title: Text("${controller.data[i]['matricule']}"),
                      subtitle: Text(
                          "${controller.data[i]['marque']}-${controller.data[i]['id']}"),
                      trailing: Text(
                        "${controller.data[i]['Affectation']}",
                        style: TextStyle(fontSize: 11),
                      ),
                      onTap: () => {
                        Get.toNamed("vhlview", arguments: [controller.data[i]]),
                      },
                    ),
                  );
                })
          ])),
        ));
  }
}
