import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:katec/helpers/sqldb.dart';

class StatusForm extends StatefulWidget {
  const StatusForm({super.key});

  @override
  State<StatusForm> createState() => _StatusFormState();
}

class _StatusFormState extends State<StatusForm> {
  SqlDb sqldb = SqlDb();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController nomStatus = TextEditingController();

  List data = [];

  Future<List> getList() async {
    List response = await sqldb.read("status");
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
          title: const Text("Input Status Parc"),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formState,
            child: Column(
              children: [
                TextFormField(
                  controller: nomStatus,
                  decoration: const InputDecoration(
                    hintText: "Status",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  onPressed: () async {
                    int resp = await sqldb
                        .insert("status", {"nomStatus": nomStatus.text});

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
                              "${data[i]['nomStatus']}",
                              style: const TextStyle(fontSize: 24),
                            )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
