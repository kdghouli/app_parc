import 'package:app_parc/home_page.dart';
import 'package:app_parc/view/auth/signup_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

GlobalKey<FormState> formState = GlobalKey();

TextEditingController emailUser = TextEditingController();
TextEditingController passUser = TextEditingController();
final dio = Dio();
List data = [];

FormData userformData =
    FormData.fromMap({'email': emailUser.text, 'password': passUser.text});

class _SignInViewState extends State<SignInView> {
  late SharedPreferences? prefs;

  Future getHttp() async {
    prefs = await SharedPreferences.getInstance();
    final response = await dio.post('http://192.168.1.107:80/api/login',
        data: userformData,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }));
    data.add(response);
    //await prefs.setString('erer', response as String);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: Column(children: [
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
                        TextFormField(
                            controller: emailUser,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: "Mail",
                            )),
                        SizedBox(
                          height: 15,
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
                            await getHttp();
                            print('verified');
                            await prefs?.setStringList(
                                'userStock', ["$emailUser", "$passUser"]);
                            print(prefs?.getStringList('userStock'));
                            Get.to(HomePage());
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
        ]));
  }
}
