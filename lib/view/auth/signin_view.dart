import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

GlobalKey<FormState> formState = GlobalKey();

TextEditingController emailUser = TextEditingController();
TextEditingController passUser = TextEditingController();

class _SignInViewState extends State<SignInView> {
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
              height: 120,
              child: Image.asset(
                "assets/images/a.jpeg",
                fit: BoxFit.contain,
              )),
          Form(
              key: formState,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        controller: emailUser,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email",
                        )),
                    TextFormField(
                      controller: passUser,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                  ]))
        ]));
  }
}
