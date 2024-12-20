import 'package:app_parc/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (loginController.isLoggedIn.value) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: loginController.logout,
              ),
            ],
          ),
          body: Center(
            child: Text('Welcome!'),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Obx(() {
                  if (loginController.isLoading.value) {
                    return CircularProgressIndicator();
                  } else {
                    return ElevatedButton(
                      onPressed: () {
                        loginController.login(
                          usernameController.text,
                          passwordController.text,
                        );
                      },
                      child: Text('Login'),
                    );
                  }
                }),
              ],
            ),
          ),
        );
      }
    });
  }
}
