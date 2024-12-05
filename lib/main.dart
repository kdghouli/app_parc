import 'package:app_parc/Testo/search_vhl.dart';
import 'package:app_parc/Testo/search_vhl_old.dart';
import 'package:app_parc/view/InputView/comment_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_parc/home.dart';
import 'package:app_parc/view/InputView/agence_form.dart';
import 'package:app_parc/view/InputView/category_form.dart';
import 'package:app_parc/view/InputView/intitule_form.dart';
import 'package:app_parc/view/InputView/service_form.dart';
import 'package:app_parc/view/InputView/status_form.dart';
import 'package:app_parc/view/InputView/vhl_form.dart';
import 'package:app_parc/view/camions/camion_view.dart';
import 'package:app_parc/view/voitures/voiture_view.dart';
import 'package:app_parc/view/parametre_view.dart';
import 'package:app_parc/view/vhl_pages/vhl_view.dart';

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
      debugShowCheckedModeBanner: true,
      color: const Color.fromARGB(255, 92, 72, 11),
      routes: {
        "/": (context) => Home(),
        "camionview": (context) => CamionView(),
        "voitureview": (context) => VoitureView(),
        "parametreview": (context) => const ParametreView(),
        "serviceform": (context) => const ServiceForm(),
        "agenceform": (context) => const AgenceForm(),
        "categoryform": (context) => const CategoryForm(),
        "intituleform": (context) => const IntituleForm(),
        "statusform": (context) => const StatusForm(),
        "vhlform": (context) => const VhlForm(),
        "commentform": (context) => const CommentForm(),
        "vhlview": (context) => const VhlView(),
        "search": (context) => const SearchVhl(),
        "addComment": (context) => const CommentForm()
      },
    );
  }
}
