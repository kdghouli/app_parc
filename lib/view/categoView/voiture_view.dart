import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_parc/controllers/getx_controller.dart';

class VoitureView extends StatelessWidget {
  VoitureView({super.key});

  final controller = Get.put(TestGetxController(),permanent: false);

  @override
  Widget build(BuildContext context) {
    controller.data = [];
    var borderRadius = const BorderRadius.only(
        topRight: Radius.circular(3), bottomRight: Radius.circular(3));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Liste des voitures"),
          backgroundColor: Colors.grey,
        ),
        body: GetBuilder<TestGetxController>(
            builder: (controller) => ListView.builder(
                physics: PageScrollPhysics(),
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
                          "${controller.data[i]['marque']}-${controller.data[i]['Intitule']}"),
                      trailing: Text(
                        "${controller.data[i]['Affectation']}",
                        style: TextStyle(fontSize: 11),
                      ),
                      onTap: () => {
                        Get.toNamed("vhlview", arguments: [controller.data[i]]),
                      },
                    ),
                  );
                })));
  }
}
