import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ParametreView extends StatefulWidget {
  const ParametreView({super.key});

  @override
  State<ParametreView> createState() => _ParametreViewState();
}

class _ParametreViewState extends State<ParametreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Paramètres"),
          backgroundColor: Colors.yellowAccent,
          actions: [
            IconButton(
                onPressed: () {
                  Get.offAllNamed("/");
                },
                icon: const Icon(
                  Icons.home_outlined,
                  size: 30,
                ))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed("vhlform");
                  },
                  child: const Text(
                    "Véhicules",
                    style: TextStyle(
                        fontSize: 22,
                        backgroundColor: Color.fromARGB(255, 150, 54, 167),
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed("serviceform");
                  },
                  child: const Text(
                    "Service",
                    style: TextStyle(
                        fontSize: 22,
                        backgroundColor: Color.fromARGB(255, 150, 54, 167),
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed("agenceform");
                    },
                    child: const Text("Agence",
                        style: TextStyle(
                            fontSize: 22,
                            backgroundColor: Color.fromARGB(255, 150, 54, 167),
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                TextButton(
                  onPressed: () {
                    Get.toNamed("intituleform");
                  },
                  child: const Text("Intitule",
                      style: TextStyle(
                          fontSize: 22,
                          backgroundColor: Color.fromARGB(255, 150, 54, 167),
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed("categoryform");
                  },
                  child: const Text("Catégorie",
                      style: TextStyle(
                          fontSize: 22,
                          backgroundColor: Color.fromARGB(255, 150, 54, 167),
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed("statusform");
                  },
                  child: const Text("Status",
                      style: TextStyle(
                          fontSize: 22,
                          backgroundColor: Color.fromARGB(255, 150, 54, 167),
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                const Text("Utilisateur",
                    style: TextStyle(
                        fontSize: 22,
                        backgroundColor: Color.fromARGB(255, 150, 54, 167),
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const Text("Commentaires",
                    style: TextStyle(
                        fontSize: 22,
                        backgroundColor: Color.fromARGB(255, 150, 54, 167),
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const Text("Kilometrages",
                    style: TextStyle(
                        fontSize: 22,
                        backgroundColor: Color.fromARGB(255, 150, 54, 167),
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const Text("Prestataires",
                    style: TextStyle(
                        fontSize: 22,
                        backgroundColor: Color.fromARGB(255, 150, 54, 167),
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const Text("Users",
                    style: TextStyle(
                        fontSize: 22,
                        backgroundColor: Color.fromARGB(255, 150, 54, 167),
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ]),
        ));
  }
}
