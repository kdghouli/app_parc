import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "mmr.db");
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''


CREATE TABLE `agences` (
`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
`nomAgence` TEXT NOT NULL,
`site` TEXT NOT NULL,
`division` TEXT NOT NULL
 
);

''');
    batch.execute('''
CREATE TABLE `intitules` (
`id` INTEGER PRIMARY KEY AUTOINCREMENT,
`nomIntitule` TEXT NOT NULL,
`isLocation` INTEGER NOT NULL,
`sousIntitule` TEXT NOT NULL,
`adresIntitule` TEXT NOT NULL,
`telIntitule` TEXT NOT NULL,
`mailIntitule` TEXT NOT NULL

);
''');

    batch.execute('''
  CREATE TABLE `services` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `nomService` TEXT NOT NULL
  
);

''');
    batch.execute('''
CREATE TABLE `categories` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `nomCategorie` TEXT
  );


''');

    batch.execute('''
CREATE TABLE `status` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `nomStatus` TEXT
  );
  

''');
    batch.insert("status", {'nomStatus': 'Ok'});
    batch.insert("status", {'nomStatus': 'Panne'});
    batch.insert("status", {'nomStatus': 'Entretien régulier'});
    batch.insert("status", {'nomStatus': 'En réparation'});
    batch.insert("status", {'nomStatus': 'Contrôle technique'});
    batch.insert("status", {'nomStatus': 'Problème de papier'});
    batch.insert("status", {'nomStatus': 'Accidentée'});

    batch.execute('''


CREATE TABLE `vhls`  (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `matricule` TEXT NOT NULL,
  `marque` TEXT,
  `type` TEXT ,
  `ww` TEXT ,
  `chassis` TEXT ,
  `puissance` TEXT ,
  `date_mc` TEXT ,
  `equipement` TEXT ,
  `observation` TEXT ,
  `deleted_at` TEXT DEFAULT NULL,
  `created_at` TEXT DEFAULT NULL,
  `updated_at` TEXT DEFAULT NULL,
  `agence_id` INTEGER UNSIGNED,
  `categorie_id` INTEGER UNSIGNED ,
  `intitule_id` INTEGER UNSIGNED ,
  `service_id` INTEGER UNSIGNED ,
  `utilisateur_id` INTEGER UNSIGNED ,
  FOREIGN KEY(agence_id) REFERENCES agences(id),
  FOREIGN KEY(intitule_id) REFERENCES intitules(id),
  FOREIGN KEY(service_id) REFERENCES services(id),
  FOREIGN KEY(utilisateur_id) REFERENCES utilisateurs(id),
  FOREIGN KEY(categorie_id) REFERENCES categories(id)
) ;




 

    ''');
    batch.insert("agences",
        {'nomAgence': 'Marrakech', 'site': 'CBGS', 'division': 'M210'});
    batch.insert("agences",
        {'nomAgence': 'Beni mellal', 'site': 'CBGS', 'division': 'M220'});
    batch.insert("agences",
        {'nomAgence': 'Khouribga', 'site': 'CBGS', 'division': 'M260'});
    batch.insert("agences",
        {'nomAgence': 'Ouarzazate', 'site': 'CBGS', 'division': 'M280'});
    batch.insert(
        "agences", {'nomAgence': 'Safi', 'site': 'CBGS', 'division': 'M240'});
    batch.insert("agences",
        {'nomAgence': 'Essaouira', 'site': 'CBGS', 'division': 'M230'});
    batch.insert("agences",
        {'nomAgence': 'Sidi Bennour', 'site': 'CBGS', 'division': 'M250'});
    batch.insert("agences",
        {'nomAgence': 'El Kelaa', 'site': 'CBGS', 'division': 'M270'});
    batch.insert("agences",
        {'nomAgence': 'Ain Harrouda', 'site': 'SCBG', 'division': 'M170'});

    batch.insert("services", {'nomService': 'Commercial'});
    batch.insert("services", {'nomService': 'Distribution'});
    batch.insert("services", {'nomService': 'Manutention'});
    batch.insert("services", {'nomService': 'Autre'});

    batch.insert("categories", {'nomCategorie': 'Camion'});
    batch.insert("categories", {'nomCategorie': 'Voiture'});
    batch.insert("categories", {'nomCategorie': 'Scooter'});
    batch.insert("categories", {'nomCategorie': 'Chariot élèvateur'});

    batch.insert("intitules", {
      'nomIntitule': 'Eccbc-SCBG',
      "isLocation": 0,
      "sousIntitule": "SCBG",
      "adresIntitule": "Casablanca",
      "telIntitule": 9999999,
      "mailIntitule": "hhafad@morocco.eccbc.com"
    });
    batch.insert("intitules", {
      'nomIntitule': 'Eccbc-CBGS',
      "isLocation": 0,
      "sousIntitule": "CBGS",
      "adresIntitule": "Marrakech",
      "telIntitule": 9999999,
      "mailIntitule": "kdghouli@morocco.eccbc.com"
    });
    batch.insert("intitules", {
      'nomIntitule': 'Eccbc-CBGN',
      "isLocation": 0,
      "sousIntitule": "CBGN",
      "adresIntitule": "Fes",
      "telIntitule": 9999999,
      "mailIntitule": "imansouri@morocco.eccbc.com"
    });
    batch.insert("intitules", {
      'nomIntitule': 'Eccbc-COBOMI',
      "isLocation": 0,
      "sousIntitule": "COBOMI",
      "adresIntitule": "Casablanca",
      "telIntitule": 9999999,
      "mailIntitule": "hhafad@morocco.eccbc.com"
    });
    batch.insert("intitules", {
      'nomIntitule': 'Chaabi Lld',
      "isLocation": 1,
      "sousIntitule": "Chaabi",
      "adresIntitule": "Casablanca",
      "telIntitule": 9999999,
      "mailIntitule": "k"
    });
    batch.insert("intitules", {
      'nomIntitule': 'Arval',
      "isLocation": 1,
      "sousIntitule": "Arval",
      "adresIntitule": "Casablanca",
      "telIntitule": 9999999,
      "mailIntitule": "k"
    });
    batch.insert("intitules", {
      'nomIntitule': 'Espace Location',
      "isLocation": 1,
      "sousIntitule": "Espace location",
      "adresIntitule": "Casablanca",
      "telIntitule": 9999999,
      "mailIntitule": "k"
    });
    batch.insert("intitules", {
      'nomIntitule': 'BM Rental',
      "isLocation": 1,
      "sousIntitule": "BM Rental",
      "adresIntitule": "Casablanca",
      "telIntitule": 9999999,
      "mailIntitule": "k"
    });
    batch.insert("intitules", {
      'nomIntitule': 'AJ Manutention',
      "isLocation": 1,
      "sousIntitule": "Aj Manutention",
      "adresIntitule": "Casablanca",
      "telIntitule": 9999999,
      "mailIntitule": "k"
    });
    batch.insert("intitules", {
      'nomIntitule': 'Trans Optiflux',
      "isLocation": 1,
      "sousIntitule": "Trans Optiflux",
      "adresIntitule": "Casablanca",
      "telIntitule": 9999999,
      "mailIntitule": "k"
    });
    batch.insert("intitules", {
      'nomIntitule': 'Ste Lagouassem',
      "isLocation": 1,
      "sousIntitule": "Ste Lagouassem",
      "adresIntitule": "Casablanca",
      "telIntitule": 9999999,
      "mailIntitule": "k"
    });
    batch.insert("intitules", {
      'nomIntitule': 'ALD',
      "isLocation": 1,
      "sousIntitule": "ALD",
      "adresIntitule": "Casablanca",
      "telIntitule": 9999999,
      "mailIntitule": "k"
    });

    await batch.commit();

    print("ok batch");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    //  deleteDatabase(db);
    //  print(deleting)
  }

  //=====================================================

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> respense = await mydb!.rawQuery(sql);
    return respense;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int respense = await mydb!.rawInsert(sql);
    return respense;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int respense = await mydb!.rawUpdate(sql);
    return respense;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int respense = await mydb!.rawDelete(sql);
    return respense;
  }

//=====================================================

//--------------------------------------------------------------
  read(String table) async {
    Database? mydb = await db;
    List<Map> respense = await mydb!.query(table);
    return respense;
  }

  insert(String table, Map<String, Object?> values) async {
    Database? mydb = await db;
    int respense = await mydb!.insert(table, values);
    return respense;
  }

  update(String sql) async {
    Database? mydb = await db;
    int respense = await mydb!.rawUpdate(sql);
    return respense;
  }

  delete(String sql) async {
    Database? mydb = await db;
    int respense = await mydb!.rawDelete(sql);
    return respense;
  }

//---------------------------------------------------------------

  supprimerDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "mmr.db");
    await deleteDatabase(path);
    print("la base a été supprimer");
  }

  getDbPath() async {
    String databasePath = await getDatabasesPath();
    print("databasePath : $databasePath");
    Directory? externalStoragePath = await getExternalStorageDirectory();
    print("externalStoragePath : $externalStoragePath");
  }

  backupDb() async {
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    var status1 = await Permission.storage.status;
    if (!status1.isGranted) {
      await Permission.storage.request();
    }

    try {
      File ourDbFile = File('/data/user/0/com.example.katec/databases/mmr.db');
      Directory? folderPathforDbFile = Directory('/storage/emulated/0/MMRDB/');
      await folderPathforDbFile.create(recursive: true);
      await ourDbFile.copySync('/storage/emulated/0/MMRDB/mmr.db');
    } catch (e) {
      print("================================Error${e.toString()}");
    }
  }

  restoreDb() async {
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    var status1 = await Permission.storage.status;
    if (!status1.isGranted) {
      await Permission.storage.request();
    }
    await supprimerDb();
    try {
      File savedDbFile = File('/storage/emulated/0/MMRDB/mmr.db');
      await savedDbFile.copy('/data/user/0/com.example.katec/databases/mmr.db');
    } catch (e) {
      print("================================Error${e.toString()}");
    }
  }
}
