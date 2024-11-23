import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CasierCustum extends StatelessWidget {
  const CasierCustum(
      {super.key, required this.nameCase, required this.nameCaseBase});

  final String nameCase;
  final String nameCaseBase;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5),
          boxShadow: [
            BoxShadow(
                offset: Offset(1.2, 1.2), color: Colors.grey, blurRadius: 1.0)
          ],
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 163, 223, 217),
            const Color.fromARGB(255, 111, 243, 230),
          ])),
      child: Row(
        children: [
          Expanded(
              child: Text(
            nameCase,
            style: TextStyle(color: Colors.grey[700]),
          )),
          Expanded(
              flex: 2,
              child: Text(
                "${Get.arguments[0][nameCaseBase] ?? '--'}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
