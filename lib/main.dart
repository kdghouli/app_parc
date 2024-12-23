import 'package:app_parc/Testo/search_vhl.dart';
import 'package:app_parc/view/InputView/comment_form.dart';
//import 'package:app_parc/view/auth/login_screen.dart';
import 'package:app_parc/view/auth/signin_view.dart';
import 'package:app_parc/view/user_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("بسم الله");
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      color: const Color.fromARGB(255, 92, 72, 11),
      getPages: [
        GetPage(name: "/", page: () => SignInView()),
        GetPage(name: "/camionview", page: () => CamionView()),
        GetPage(name: "/voitureview", page: () => VoitureView()),
        GetPage(name: "/parametreview", page: () => ParametreView()),
        GetPage(name: "/serviceform", page: () => ServiceForm()),
        GetPage(name: "/agenceform", page: () => AgenceForm()),
        GetPage(name: "/categoryform", page: () => CategoryForm()),
        GetPage(name: "/intituleform", page: () => IntituleForm()),
        GetPage(name: "/vhlform", page: () => VhlForm()),
        GetPage(name: "/commentform", page: () => CommentForm()),
        GetPage(name: "/vhlview", page: () => VhlView()),
        GetPage(name: "/search", page: () => SearchVhl()),
        GetPage(name: "/addComment", page: () => CommentForm()),
        GetPage(name: "/statusform", page: () => StatusForm()),
        GetPage(name: "/userview", page: () => UserView())
      ],
    );
  }
}
