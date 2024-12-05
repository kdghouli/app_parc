import 'package:get/get.dart';
import 'package:app_parc/helpers/sqldb.dart';

class TestGetxController extends GetxController {
  SqlDb sqlDb = SqlDb();

  List response = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Future<List> getListVhlCategorie(int idCatego) async {
  //   List response = await sqlDb.read("vhls");
  //   print(response);
  //   data.addAll(response.where((ele) => ele['categorie_id'] == idCatego));
  //   update();
  //   return response;
  // }

  Future<List> getVhlsComplet() async {
    response = await sqlDb.readData('''
SELECT matricule,marque,vhls.id,categorie_id,nomIntitule AS Intitule ,nomCategorie AS Catègorie,nomAgence AS Affectation,nomService AS Service
FROM vhls 
JOIN intitules,categories,agences,services
ON vhls.intitule_id=intitules.id AND vhls.categorie_id=categories.id AND agences.id=vhls.agence_id AND services.id=vhls.service_id
ORDER BY Affectation

''');
    print("getVhlsComplet");
    //data.addAll(response);
    update();
    return response;
  }

  Future<List> getVhlsCategorie(int idCatego) async {
    response = await sqlDb.readData('''
SELECT matricule,marque,chassis,categorie_id,nomIntitule AS Intitule,vhls.id ,nomCategorie AS Catègorie,nomAgence AS Affectation,nomService AS Service
FROM vhls
JOIN intitules,categories,agences,services
ON vhls.intitule_id=intitules.id AND vhls.categorie_id=categories.id AND agences.id=vhls.agence_id AND services.id=vhls.service_id
WHERE  categorie_id =$idCatego
ORDER BY Affectation ''');

    //print(response);
    //data.addAll(response);
    update();
    return response;
  }

  Future<List> getRecapCatego() async {
    List response = await sqlDb.readData(
        '''SELECT categories.id,categories.nomCategorie as Catégorie ,count(vhls.matricule) AS Nb
FROM categories
JOIN vhls
ON vhls.categorie_id=categories.id
GROUP BY nomCategorie
ORDER BY categories.id ''');
    print(response);
    //data.addAll(response);
    update();
    return response;
  }

//   void filterTreeTypes(searchString) {
//     List<TreeType> treeList = [];

//   List treeTypeList.value = treeList.where((element) =>
//         element.name.toLowerCase().contains(searchString.toLowerCase())).toList();
// }
}
