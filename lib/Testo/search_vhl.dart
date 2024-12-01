import 'package:app_parc/helpers/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchVhl extends StatefulWidget {
  const SearchVhl({super.key});

  @override
  State<SearchVhl> createState() => _SearchVhlState();
}

SqlDb sqlDb = SqlDb();
List data = [];

Future getVhlBase() async {
  List response = await sqlDb.read("vhls");

  return data.addAll(response);
}

class _SearchVhlState extends State<SearchVhl> {
  @override
  void initState() {
    getVhlBase();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chercher véhicule"),
          backgroundColor: Colors.grey[400],
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed("parametreview");
                },
                icon: const Icon(
                  Icons.settings,
                  size: 32,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 10.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
                print(controller.value);
                data.where((val) => data.contains(controller.value == val));
              },
              leading: const Icon(Icons.search),
              trailing: <Widget>[
                Tooltip(
                  message: 'Change brightness mode',
                  child: IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.wb_sunny_outlined),
                    selectedIcon: const Icon(Icons.brightness_2_outlined),
                  ),
                )
              ],
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(data.length, (int i) {
              return ListTile(
                title: Text(
                    '${data[i]["matricule"]} - - - - >  ${data[i]["marque"]}'),
                onTap: () {
                  setState(() {
                    Get.toNamed("vhlview", arguments: [data[i]]);
                  });
                },
              );
            });
          }),
        ));
  }
}
