import 'package:app_parc/controllers/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconsParc extends StatelessWidget {
  final String? textIco;
  final Icon ikon;
  final String? page;
  final int nn;

  IconsParc(
      {super.key,
      required this.textIco,
      required this.ikon,
      this.page,
      required this.nn});

  TestGetxController ctrl = Get.put(TestGetxController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
        onPressed: () {
          Get.toNamed("$page");
          ctrl.getVhlsCategorie(nn);
        },
        icon: ikon,
        iconSize: 82.00,
      ),
      Text(
        "$textIco",
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      )
    ]);
  }
}
