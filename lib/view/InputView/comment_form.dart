import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:app_parc/helpers/sqldb.dart';

class CommentForm extends StatefulWidget {
  const CommentForm({super.key});

  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  SqlDb sqldb = SqlDb();
  bool isAlert = false;

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController commentaire = TextEditingController();
  TextEditingController par = TextEditingController();

  List data = [];
  List dataStatus = [];

  var _dropdownvalueSt;
  var _dropdownvalueVhl;

  Future<List> getList() async {
    List response = await sqldb.read("vhls");
    print(response);
    data.addAll(response);
    setState(() {});
    return response;
  }

  getListStatus() async {
    List response = await sqldb.read("status");
    print(response);
    dataStatus.addAll(response);
    setState(() {});
    return response;
  }

  @override
  void initState() {
    super.initState();
    getList();
    getListStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Input Commentaire"),
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formState,
            child: Column(
              children: [
                DropdownButtonFormField(
                  hint: const Text("Véhicule"),
                  items: data.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem(
                      value: e["id"].toString(),
                      child: Text(e["matricule"].toString()),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (v) {
                    _dropdownvalueVhl = v;
                    setState(() {});
                  },
                  value: _dropdownvalueVhl,
                ),
                TextFormField(
                  controller: commentaire,
                  decoration: const InputDecoration(
                    hintText: "Commentaire",
                  ),
                ),
                TextFormField(
                  controller: par,
                  decoration: const InputDecoration(
                    hintText: "Par :",
                  ),
                ),
                DropdownButtonFormField(
                  hint: const Text("Status"),
                  items: dataStatus.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem(
                      value: e["id"].toString(),
                      child: Text(e["nomStatus"].toString()),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (v) {
                    _dropdownvalueSt = v;
                    print(v);
                    setState(() {});
                  },
                  value: _dropdownvalueSt,
                ),
                CheckboxListTile(
                  title: Text("Alerte"),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: isAlert,
                  onChanged: (value) {
                    setState(() {
                      isAlert = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                MaterialButton(
                  onPressed: () async {
                    int resp = await sqldb.insert("commentaires", {
                      "commentaire": commentaire.text,
                      "par": par.text,
                      "date_comment": DateTime.now(),
                      "vhl_id": _dropdownvalueVhl.toString(),
                      "status_id": _dropdownvalueSt.toString(),
                      "isAlert": 0
                    });
                  },
                  color: const Color.fromARGB(225, 34, 139, 238),
                  textColor: Colors.white,
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ));
  }
}
