import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:app_parc/helpers/sqldb.dart';

class CategoryForm extends StatefulWidget {
  const CategoryForm({super.key});

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  SqlDb sqldb = SqlDb();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController nomCategorie = TextEditingController();

  List data = [];

  Future<List> getList() async {
    List response = await sqldb.read("categories");
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
                  controller: nomCategorie,
                  decoration: const InputDecoration(
                    hintText: "Categorie",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  onPressed: () async {
                    int resp = await sqldb.insert(
                        "categories", {"nomCategorie": nomCategorie.text});

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
                              "${data[i]['nomCategorie']}",
                              style: const TextStyle(fontSize: 30),
                            )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
