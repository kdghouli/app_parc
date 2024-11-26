import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_parc/controllers/getx_controller.dart';

class CamionView extends StatefulWidget {
  const CamionView({super.key});

  @override
  State<CamionView> createState() => _CamionViewState();
}

final controller = Get.put(TestGetxController(), permanent: false);

class _CamionViewState extends State<CamionView> {
  @override
  void initState() {
    super.initState();
    controller.data = [];
    // controller.getVhlsCategorie(1);
  }

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
                itemCount: controller.data.length,
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
                })
          ])),
        ));
  }
}
