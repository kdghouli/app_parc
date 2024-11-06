import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:katec/sqldb.dart';

class IntituleForm extends StatefulWidget {
  const IntituleForm({super.key});

  @override
  State<IntituleForm> createState() => _IntituleFormState();
}

class _IntituleFormState extends State<IntituleForm> {
  SqlDb sqldb = SqlDb();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController nomIntitule = TextEditingController();
  TextEditingController isLocation = TextEditingController();
  TextEditingController sousIntitule = TextEditingController();
  TextEditingController adresIntitule = TextEditingController();
  TextEditingController telIntitule = TextEditingController();
  TextEditingController mailIntitule = TextEditingController();

  List data = [];

  Future<List> getList() async {
    List response = await sqldb.read("intitules");
    print(response);
    data.addAll(response);
    setState(() {});
    return response;
  }

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Input Intitule Parc"),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formState,
            child: Column(
              children: [
                TextFormField(
                  controller: nomIntitule,
                  decoration: const InputDecoration(
                    hintText: "Intitulaire",
                  ),
                ),
                TextFormField(
                  controller: isLocation,
                  decoration: const InputDecoration(
                    hintText: "Location",
                  ),
                ),
                TextFormField(
                  controller: sousIntitule,
                  decoration: const InputDecoration(
                    hintText: "Site",
                  ),
                ),
                TextFormField(
                  controller: adresIntitule,
                  decoration: const InputDecoration(
                    hintText: "Adresse",
                  ),
                ),
                TextFormField(
                  controller: telIntitule,
                  decoration: const InputDecoration(
                    hintText: "Tél",
                  ),
                ),
                TextFormField(
                  controller: mailIntitule,
                  decoration: const InputDecoration(
                    hintText: "Mail",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () async {
                    int resp = await sqldb
                        .insert("intitules", {"nomIntitule": nomIntitule.text});

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
                              "${data[i]['nomIntitule']}",
                              style: const TextStyle(fontSize: 22),
                            )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
