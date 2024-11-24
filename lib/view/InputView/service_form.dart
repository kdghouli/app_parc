import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:katec/helpers/sqldb.dart';

class ServiceForm extends StatefulWidget {
  const ServiceForm({super.key});

  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  SqlDb sqldb = SqlDb();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController nomService = TextEditingController();

  List data = [];

  Future<List> getList() async {
    List response = await sqldb.read("services");
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
          title: const Text("Input Services Parc"),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formState,
            child: Column(
              children: [
                TextFormField(
                  controller: nomService,
                  decoration: const InputDecoration(
                    hintText: "Service",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  onPressed: () async {
                    int resp = await sqldb
                        .insert("services", {"nomService": nomService.text});

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
                              "${data[i]['nomService']}",
                              style: TextStyle(fontSize: 30),
                            )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
