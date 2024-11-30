import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_parc/controllers/getx_controller.dart';

class CamionView extends StatelessWidget {
  CamionView({super.key});

  final controller = Get.put(TestGetxController());

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.only(
        topRight: Radius.circular(2), bottomRight: Radius.circular(2));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Liste des camions"),
          backgroundColor: Colors.grey,
        ),
        body: GetBuilder<TestGetxController>(
          init: TestGetxController(),
          builder: (controller) => SingleChildScrollView(
              child: Column(children: [
            ListView.builder(
                physics: PageScrollPhysics(),
                padding: const EdgeInsets.all(2),
                shrinkWrap: true,
                itemCount: controller.response.length,
                itemBuilder: (context, i) {
                  return Card(
                    margin: EdgeInsets.all(2),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: borderRadius),
                      leading: const Icon(
                        Icons.local_shipping,
                        color: Colors.redAccent,
                        size: 26,
                      ),
                      dense: true,
                      title: Text("${controller.response[i]['matricule']}"),
                      subtitle: Text(
                          "${controller.response[i]['marque']}-${controller.response[i]['Intitule']}"),
                      trailing: Text(
                        "${controller.response[i]['Affectation']}",
                        style: TextStyle(fontSize: 11),
                      ),
                      onTap: () => {
                        Get.toNamed("vhlview",
                            arguments: [controller.response[i]]),
                      },
                    ),
                  );
                })
          ])),
        ));
  }
}
