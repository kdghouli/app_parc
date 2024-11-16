import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconsParc extends StatelessWidget {
  final String? textIco;
  final Icon ikon;

  const IconsParc({super.key, required this.textIco, required this.ikon});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
          onPressed: () {
          Get.toNamed("camionview");
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
