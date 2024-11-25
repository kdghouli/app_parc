import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:app_parc/helpers/sqldb.dart';

class AgenceForm extends StatefulWidget {
  const AgenceForm({super.key});

  @override
  State<AgenceForm> createState() => _AgenceFormState();
}

class _AgenceFormState extends State<AgenceForm> {
  SqlDb sqldb = SqlDb();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController nomAgence = TextEditingController();
  TextEditingController division = TextEditingController();
  TextEditingController site = TextEditingController();

  List data = [];

  Future<List> getList() async {
    List response = await sqldb.read("agences");
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
          title: const Text("Input Agence Parc"),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formState,
            child: Column(
              children: [
                TextFormField(
                  controller: nomAgence,
                  decoration: const InputDecoration(
                    hintText: "Agence",
                  ),
                ),
                TextFormField(
                  controller: division,
                  decoration: const InputDecoration(
                    hintText: "Division",
                  ),
                ),
                TextFormField(
                  controller: site,
                  decoration: const InputDecoration(
                    hintText: "Site",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  onPressed: () async {
                    int resp = await sqldb.insert("agences", {
                      "nomAgence": nomAgence.text,
                      "division": division.text,
                      "site": site.text
                    });

                    if (resp > 0) {
                      Get.offAllNamed("parametreview");
                    }
                  },
                  color: Colors.amber,
                  child: const Text("Save"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ...List.generate(
                        data.length,
                        (i) => Text(
                              "${data[i]['nomAgence']}",
                              style: const TextStyle(fontSize: 26),
                            )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
