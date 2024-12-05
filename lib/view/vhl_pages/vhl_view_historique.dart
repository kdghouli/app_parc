import 'package:app_parc/helpers/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        return Icon(Icons.local_shipping);
      case 2:
        return Icon(Icons.directions_car);
      case 4:
        return Icon(Icons.forklift);
      case 3:
        return Icon(Icons.delivery_dining);
      default:
        return Icon(Icons.hiking);
    }
  }

  Future getListComment() async {
    dataComment = await sqldb.readData('''
SELECT * 
FROM commentaires 
WHERE vhl_id = ${Get.arguments[0]['id']}
''');
    print('${Get.arguments}');
    print(dataComment);
    setState(() {});
    return dataComment;
  }

  @override
  void initState() {
    super.initState();

    getListComment();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataComment.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.dangerous),
            title: Text("${dataComment[i]['comment']}"),
            iconColor: Colors.red,
            isThreeLine: true,
            subtitle: Text("${dataComment[i]['date_comment']}"),
            enabled: true,
            trailing: Text("${dataComment[i]['isAlert']}"),
            tileColor: Colors.amber[50],
          );
        });
  }
}
