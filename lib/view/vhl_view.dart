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
          unselectedItemColor: Colors.green[300],
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
                fontWeight: FontWeight.w500,
                color: Colors.deepOrange,
                fontSize: 28),
          ),
          backgroundColor: Colors.grey[400],
          shadowColor: Colors.tealAccent),
      body: _pageOptions[selectedPage],
    );
  }
}
