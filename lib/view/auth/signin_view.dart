import 'package:app_parc/controllers/login_controller.dart';
import 'package:app_parc/home_page.dart';
import 'package:app_parc/view/auth/signup_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final LoginController controller = Get.put(LoginController());

  //List dato = [];

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController emailUser = TextEditingController();
  TextEditingController passUser = TextEditingController();

  // FormData userformData =
  // FormData.fromMap({'email': emailUser.text, 'password': passUser.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: controller.logout,
            ),
          ],
        ),
        body: GetBuilder<LoginController>(
            builder: (controller) => Column(children: [
                  Container(
                      color: Colors.grey,
                      height: 130,
                      child: Image.asset(
                        "assets/images/a.jpeg",
                        fit: BoxFit.scaleDown,
                      )),
                  Container(
                      padding: EdgeInsets.all(25),
                      child: Form(
                          key: formState,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text((controller.storage
                                          .read('data')
                                          .toString()) ??
                                      "-"),
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
                                  height: 30,
                                ),
                                MaterialButton(
                                  onPressed: () async {
                                    await controller.login(
                                        emailUser.text, passUser.text);
                                    //print('verified');
                                  },
                                  color: Colors.amber,
                                  child: const Text("Connecter"),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => SignUpView());
                                  },
                                  child: Text("Enregistrer ..."),
                                ),
                                //Text(prefs?.getStringList('userStock').toString())
                              ])))
                ])));
  }
}
