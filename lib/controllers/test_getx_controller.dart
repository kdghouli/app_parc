import 'package:get/get.dart';
import 'package:katec/helpers/sqldb.dart';

class TestGetxController extends GetxController {
  SqlDb sqlDb = SqlDb();
  int counter = 6;
  List data = [];

  int? icrementer() {
    counter++;
    update();
  }

  int? decrementer() {
    counter--;
    update();
  }

  Future<List> getListVhlCategorie(int idCategorie) async {
    List response = await sqlDb.read("vhls");
    print(response);
    data.addAll(response.where((ele) => ele['categorie_id'] == idCategorie));
    update();
    return response;
  }

  Future<List> getVhlsComplet() async {
    List response = await sqlDb.readData('''
SELECT matricule,marque,intitules.nomIntitule AS Intitule ,categories.nomCategorie AS Catègorie,agences.nomAgence AS Affectation,services.nomService AS Service
FROM vhls
JOIN intitules,categories,agences,services
ON vhls.intitule_id=intitules.id AND vhls.categorie_id=categories.id AND agences.id=vhls.agence_id AND services.id=vhls.service_id


''');
    print(response);
    data.addAll(response);
    update();
    return response;
  }
}
