import 'package:flutter/material.dart';
import 'package:katec/helpers/sqldb.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

SqlDb sqldb = SqlDb();

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List data = [];

  var _dropdownvalue;

  getList() async {
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
    return DropdownButtonFormField<String>(
      isExpanded: true,
      items: data.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem(
          value: e["id"].toString(),
          child: Text(e["nomAgence"].toString()),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_downward),
      onChanged: (v) {
        _dropdownvalue = v;
        print(v);
        setState(() {});
      },
      value: _dropdownvalue,
    );
  }
}
