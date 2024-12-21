import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 60, bottom: 100, left: 15),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
        ],
      ),
    );
  }
}
