import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_parc/home.dart';
import 'package:app_parc/view/InputView/agence_form.dart';
import 'package:app_parc/view/InputView/category_form.dart';
import 'package:app_parc/view/InputView/intitule_form.dart';
import 'package:app_parc/view/InputView/service_form.dart';
import 'package:app_parc/view/InputView/status_form.dart';
import 'package:app_parc/view/InputView/vhl_form.dart';
import 'package:app_parc/view/categoView/camion_view.dart';
import 'package:app_parc/view/categoView/voiture_view.dart';
import 'package:app_parc/view/parametre_view.dart';
import 'package:app_parc/view/vhl_view/vhl_view.dart';

void main() {
  print("بسم الله");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      color: Colors.amber,
      routes: {
        "/": (context) => Home(),
        "camionview": (context) => const CamionView(),
        "voitureview": (context) => const VoitureView(),
        "parametreview": (context) => const ParametreView(),
        "serviceform": (context) => const ServiceForm(),
        "agenceform": (context) => const AgenceForm(),
        "categoryform": (context) => const CategoryForm(),
        "intituleform": (context) => const IntituleForm(),
        "statusform": (context) => const StatusForm(),
        "vhlform": (context) => const VhlForm(),
        "vhlview": (context) => const VhlView()
      },
    );
  }
}
