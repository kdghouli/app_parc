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
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5),
          boxShadow: [
            BoxShadow(
                offset: Offset(1.2, 1.2), color: Colors.grey, blurRadius: 1.0)
          ],
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 250, 250, 250),
            Color.fromARGB(255, 192, 189, 189),
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
