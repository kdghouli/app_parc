import 'package:flutter/material.dart';
import 'package:katec/sqldb.dart';

class CamionView extends StatefulWidget {
  const CamionView({super.key});

  @override
  State<CamionView> createState() => _CamionViewState();
}

class _CamionViewState extends State<CamionView> {
  SqlDb sqlDb = SqlDb();

  List data = [];

  Future<List> getList() async {
    List response = await sqlDb.read("vhls");
    print(response);
    data.addAll(response.where((ele) => ele['categorie_id'] == 1));
    setState(() {});
    return response;
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.only(
        topRight: Radius.circular(10), bottomRight: Radius.circular(10));
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.amber,
          child: const Text("data"),
        ),
        appBar: AppBar(
          title: const Text("Liste des camions"),
          backgroundColor: Colors.grey,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(4),
          itemCount: data.length,
          itemBuilder: (context, i) {
            return Card(
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                leading: const Icon(
                  Icons.local_shipping,
                  color: Colors.redAccent,
                  size: 25,
                ),
                dense: true,
                title: Text("${data[i]['matricule']}"),
                subtitle: Text("${data[i]['marque']}"),
                trailing: Text("${data[i]['agence_id']}"),
              ),
            );
          },
        ));
  }
}


// children: [
//             ...List.generate(
//                 data.length,
//                 (i) =>
//                     Text("${data[i]['matricule']} - ${data[i]['agence_id']}")),
//           ],