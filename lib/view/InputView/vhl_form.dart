import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:katec/helpers/sqldb.dart';

class VhlForm extends StatefulWidget {
  const VhlForm({super.key});

  @override
  State<VhlForm> createState() => _VhlFormState();
}

class _VhlFormState extends State<VhlForm> {
  SqlDb sqldb = SqlDb();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController matricule = TextEditingController();
  TextEditingController marque = TextEditingController();
  TextEditingController date_mc = TextEditingController();

  List data = [];
  List dataAgence = [];
  List dataCategorie = [];
  List dataService = [];
  List dataIntitule = [];

  var _dropdownvalueAg;
  var _dropdownvalueCt;
  var _dropdownvalueSc;
  var _dropdownvalueTt;
  Future<List> getList() async {
    List response = await sqldb.read("vhls");
    print(response);
    data.addAll(response);
    setState(() {});
    return response;
  }

  getListAgence() async {
    List response = await sqldb.read("agences");
    print(response);
    dataAgence.addAll(response);
    setState(() {});
    return response;
  }

  getListService() async {
    List response = await sqldb.read("services");
    print(response);
    dataService.addAll(response);
    setState(() {});
    return response;
  }

  getListCategorie() async {
    List response = await sqldb.read("categories");
    print(response);
    dataCategorie.addAll(response);
    setState(() {});
    return response;
  }

  getListTitulaire() async {
    List response = await sqldb.read("intitules");
    print(response);
    dataIntitule.addAll(response);
    setState(() {});
    return response;
  }

  @override
  void initState() {
    super.initState();
    getList();
    getListAgence();
    getListCategorie();
    getListTitulaire();
    getListService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Input véhicule du Parc"),
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formState,
            child: Column(
              children: [
                TextFormField(
                  controller: matricule,
                  decoration: const InputDecoration(
                    hintText: "Immatricule",
                  ),
                ),
                TextFormField(
                  controller: marque,
                  decoration: const InputDecoration(
                    hintText: "Marque",
                  ),
                ),
                TextFormField(
                  controller: date_mc,
                  decoration: const InputDecoration(
                    hintText: "Date de mise en circulation",
                  ),
                ),
                DropdownButtonFormField(
                  hint: const Text("Catégorie"),
                  items: dataCategorie.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem(
                      value: e["id"].toString(),
                      child: Text(e["nomCategorie"].toString()),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (v) {
                    _dropdownvalueCt = v;
                    print(v);
                    setState(() {});
                  },
                  value: _dropdownvalueCt,
                ),
                DropdownButtonFormField(
                  hint: const Text("Service"),
                  items: dataService.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem(
                      value: e["id"].toString(),
                      child: Text(e["nomService"].toString()),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (v) {
                    _dropdownvalueSc = v;
                    print(v);
                    setState(() {});
                  },
                  value: _dropdownvalueSc,
                ),
                DropdownButtonFormField(
                  hint: const Text("Intitule"),
                  items: dataIntitule.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem(
                      value: e["id"].toString(),
                      child: Text(e["nomIntitule"].toString()),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (v) {
                    _dropdownvalueTt = v;
                    print(v);
                    setState(() {});
                  },
                  value: _dropdownvalueTt,
                ),
                DropdownButtonFormField(
                  hint: const Text("Agence"),
                  items: dataAgence.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem(
                      value: e["id"].toString(),
                      child: Text(e["nomAgence"].toString()),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (v) {
                    _dropdownvalueAg = v;
                    print(v);
                    setState(() {});
                  },
                  value: _dropdownvalueAg,
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  onPressed: () async {
                    int resp = await sqldb.insert("vhls", {
                      "matricule": matricule.text,
                      "marque": marque.text,
                      "date_mc": date_mc.text,
                      "agence_id": _dropdownvalueAg.toString(),
                      "categorie_id": _dropdownvalueCt.toString(),
                      "service_id": _dropdownvalueSc.toString(),
                      "intitule_id": _dropdownvalueTt.toString()
                    });

                    if (resp > 0) {
                      Get.offAllNamed("parametreview");
                    }
                  },
                  color: Colors.amber,
                  child: const Text("Save"),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ...List.generate(
                        data.length,
                        (i) => Text(
                              "${data[i]['matricule']}",
                              style: const TextStyle(fontSize: 20),
                            )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
