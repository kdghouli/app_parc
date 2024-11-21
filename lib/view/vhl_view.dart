import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:katec/view/vhl_view_donnee.dart';
import 'package:katec/view/vhl_view_historique.dart';
import 'package:katec/view/vhl_view_papier.dart';

class VhlView extends StatefulWidget {
  const VhlView({super.key});

  @override
  State<VhlView> createState() => _VhlViewState();
}

class _VhlViewState extends State<VhlView> {
  int selectedPage = 0;

  final _pageOptions = [VhlViewDonnee(), VhlViewHistorique(), VhlViewPapier()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "Donnèes",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "Hist"),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt), label: "Papiers"),
          ],
          currentIndex: selectedPage,
          selectedItemColor: Colors.redAccent,
          elevation: 5.0,
          unselectedItemColor: Colors.tealAccent[300],
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          }),
      appBar: AppBar(
          title: Text(
            "${Get.arguments[0]['matricule']}",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.teal[800],
                fontSize: 29,
                letterSpacing: 4,
                shadows: [
                  Shadow(
                      color: const Color.fromARGB(255, 250, 246, 246),
                      offset: Offset(2, 1),
                      blurRadius: 2)
                ]),
          ),
          backgroundColor: Colors.grey[400],
          shadowColor: Colors.tealAccent),
      body: _pageOptions[selectedPage],
    );
  }
}
