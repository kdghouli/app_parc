import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_parc/controllers/getx_controller.dart';

class ChariotsView extends StatelessWidget {
  ChariotsView({super.key});

  final controller = Get.put(TestGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Liste des Chariots"),
          backgroundColor: Colors.grey,
        ),
        body: GetBuilder<TestGetxController>(
            builder: (controller) => ListView.builder(
                physics: PageScrollPhysics(),
                padding: const EdgeInsets.all(3),
                shrinkWrap: true,
                itemCount: controller.response.length,
                itemBuilder: (context, i) {
                  return Card(
                    color: Colors.orange[100],
                    elevation: 2,
                    margin: EdgeInsets.all(3),
                    child: ListTile(
                      leading: const Icon(
                        Icons.forklift,
                        color: Colors.redAccent,
                        size: 26,
                      ),
                      dense: true,
                      title: Text(
                        "${controller.response[i]['matricule']}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text("${controller.response[i]['marque']}"),
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
                })));
  }
}
