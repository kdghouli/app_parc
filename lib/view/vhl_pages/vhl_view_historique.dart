import 'package:app_parc/helpers/sqldb.dart';
import 'package:flutter/material.dart';

class VhlViewHistorique extends StatefulWidget {
  const VhlViewHistorique({super.key});

  @override
  State<VhlViewHistorique> createState() => _VhlViewHistoriqueState();
}

class _VhlViewHistoriqueState extends State<VhlViewHistorique> {
  SqlDb sqldb = SqlDb();
  List dataComment = [];

  chooseIcon(val) {
    switch (val) {
      case 1:
        print(1);
      case 2:
        print(2);
      default:
        print('Invalid');
    }
  }

  Future getListComment() async {
    dataComment = await sqldb.read("commentaires");
    print(dataComment);
    setState(() {});
    return dataComment;
  }

  @override
  void initState() {
    super.initState();
    chooseIcon(3);
    getListComment();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataComment.length,
        itemBuilder: (context, i) {
          return ListTile(title: Text("$i"));
        });
  }
}
