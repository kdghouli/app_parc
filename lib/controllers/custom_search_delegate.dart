import 'package:app_parc/helpers/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  // Dummy list
  List searchList = [];

  SqlDb sqlDb = SqlDb();

  Future getVhlBase() async {
    List response = await sqlDb.read("vhls");
    return searchList.addAll(response);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List searchResults =
        searchList.where((item) => item["matricule"].contains(query)).toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]["matricule"]),
          onTap: () {
            // Handle the selected search result.

            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    getVhlBase();
    print(searchList);
    final List suggestionList = query.isEmpty
        ? []
        : searchList
            .where((item) => item['matricule'].contains(query))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading:
              Icon(
                  Icons.local_shipping,
                  color: Colors.redAccent,
                  size: 26,
                ),
          title: Text(suggestionList[index]['matricule']),
          onTap: () {
            Get.toNamed("vhlview", arguments: [suggestionList[index]]);
            query = suggestionList[index]['matricule'];

            // Show the search results based on the selected suggestion.
          },
        );
      },
    );
  }

  // These methods are mandatory you cannot skip them.
}
