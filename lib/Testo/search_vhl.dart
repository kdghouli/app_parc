import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchVhl extends StatefulWidget {
  const SearchVhl({super.key});

  @override
  State<SearchVhl> createState() => _SearchVhlState();
}

class _SearchVhlState extends State<SearchVhl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chercher véhicule"),
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("parametreview");
              },
              icon: const Icon(
                Icons.settings,
                size: 32,
              ))
        ],
      ),
      body: Text("search"),
    );
  }
}
