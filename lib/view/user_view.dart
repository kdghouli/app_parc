import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//final controller = Get.lazyPut(() => LoginController());

class UserView extends StatelessWidget {
  UserView({super.key});
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User")),
      body: Text(storage.read('data'.isURL.toString())),
    );
    // GetBuilder<LoginController>(
    //     builder: (controller) =>
    //         Text(controller.storage.read('data').toString()..length)));
  }
}
