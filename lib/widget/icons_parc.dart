import 'package:app_parc/controllers/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconsParc extends StatelessWidget {
  final String? textIco;
  final Icon ikon;
  final Widget page;
  final int nn;

  IconsParc(
      {super.key,
      required this.textIco,
      required this.ikon,
      required this.page,
      required this.nn});

  TestGetxController ctrl = Get.put(TestGetxController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.cyan[200],
      ),
      //
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
          onPressed: () {
            Get.to(() => page);
            ctrl.getVhlsCategorie(nn);
          },
          icon: ikon,
          iconSize: 76.00,
        ),
        Text(
          "$textIco",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
