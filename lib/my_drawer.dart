import 'package:app_parc/controllers/login_controller.dart';
import 'package:app_parc/view/auth/signin_view.dart';
import 'package:app_parc/view/user_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 60, bottom: 100, left: 5),
      width: 160,
      child: GetBuilder<LoginController>(
        builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => UserView());
                      },
                      icon: Icon(
                        Icons.person,
                        size: 40,
                      ),
                    ),
                    Text("kdghouli@gmail"),
                  ]),
              Divider(
                indent: 2,
                endIndent: 3,
                height: 5,
                thickness: 1,
                color: Colors.cyan,
              ),
              Text("Visites techniques"),
              Text("Assurances"),
              Text("Carnets de circulation"),
              Text("Tachygraphes"),
              Text("Contrats de location"),
              Text("Listes par ...."),
              Text("Tableau de bord"),
              Divider(
                indent: 2,
                endIndent: 3,
                height: 5,
                thickness: 1,
                color: Colors.cyan,
              ),
              MaterialButton(
                  onPressed: () {
                    controller.logout();
                    Get.off(() => SignInView());
                  },
                  child:
                      Row(children: [Icon(Icons.logout), Text("Déconnecter")])),
            ]),
      ),
    );
  }
}
