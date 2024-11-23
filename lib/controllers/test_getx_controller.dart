import 'package:get/get.dart';
import 'package:katec/helpers/sqldb.dart';

class TestGetxController extends GetxController {
  SqlDb sqlDb = SqlDb();

  List data = [];

  // Future<List> getListVhlCategorie(int idCatego) async {
  //   List response = await sqlDb.read("vhls");
  //   print(response);
  //   data.addAll(response.where((ele) => ele['categorie_id'] == idCatego));
  //   update();
  //   return response;
  // }

  Future<List> getVhlsComplet() async {
    List response = await sqlDb.readData('''
SELECT matricule,marque,vhls.id,categorie_id,nomIntitule AS Intitule ,nomCategorie AS Catègorie,nomAgence AS Affectation,nomService AS Service
FROM vhls 
JOIN intitules,categories,agences,services
ON vhls.intitule_id=intitules.id AND vhls.categorie_id=categories.id AND agences.id=vhls.agence_id AND services.id=vhls.service_id
ORDER BY Affectation

''');
    print(response);
    data.addAll(response);
    update();
    return response;
  }

  Future<List> getVhlsCategorie(int idCatego) async {
    List response = await sqlDb.readData('''
SELECT matricule,marque,chassis,categorie_id,nomIntitule AS Intitule ,nomCategorie AS Catègorie,nomAgence AS Affectation,nomService AS Service
FROM vhls
JOIN intitules,categories,agences,services
ON vhls.intitule_id=intitules.id AND vhls.categorie_id=categories.id AND agences.id=vhls.agence_id AND services.id=vhls.service_id
WHERE  categorie_id =$idCatego
ORDER BY Affectation ''');

    print(response);
    data.addAll(response);
    update();
    return response;
  }

  Future<List> getRecapCatego() async {
    List response = await sqlDb.readData(
        '''SELECT categories.id,categories.nomCategorie ,count(vhls.matricule) AS Nb
FROM categories
JOIN vhls
ON vhls.categorie_id=categories.id
GROUP BY nomCategorie
ORDER BY categories.id ''');
    print(response);
    data.addAll(response);
    return response;
  }
}
