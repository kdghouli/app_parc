import 'package:app_parc/controllers/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

GlobalKey<FormState> formState = GlobalKey();

TextEditingController nameUser = TextEditingController();
TextEditingController emailUser = TextEditingController();
TextEditingController passUser = TextEditingController();
final dio = Dio();

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) => Scaffold(
            backgroundColor: Colors.grey[400],
            appBar: AppBar(
              backgroundColor: Colors.grey,
            ),
            body: Column(children: [
              Container(
                  color: Colors.grey,
                  height: 130,
                  child: Image.asset(
                    "assets/images/b.jpeg",
                    fit: BoxFit.contain,
                  )),
              Container(
                  padding: EdgeInsets.all(30),
                  child: Form(
                      key: formState,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                                controller: nameUser,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: "Nom et Prénom",
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                controller: emailUser,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: "Mail",
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passUser,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: "Password",
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            MaterialButton(
                              onPressed: () async {
                                await controller.saveUser(nameUser.text,
                                    emailUser.text, passUser.text);
                                print('Enregister');
                                Get.back();
                              },
                              color: Colors.amber,
                              child: const Text("Enregister"),
                            ),
                          ])))
            ])));
  }
}
