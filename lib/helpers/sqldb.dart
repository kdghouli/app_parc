import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
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
  `utilisateur` TEXT,
  FOREIGN KEY(agence_id) REFERENCES agences(id),
  FOREIGN KEY(intitule_id) REFERENCES intitules(id),
  FOREIGN KEY(service_id) REFERENCES services(id),
  FOREIGN KEY(categorie_id) REFERENCES categories(id)
) ;




 

    ''');

    batch.execute('''


CREATE TABLE `commentaires`  (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,

  `comment` TEXT NOT NULL,
  `status_id` INTEGER UNSIGNED ,
  `vhl_id` INTEGER UNSIGNED ,
  `par` TEXT ,
  `date_comment` TEXT ,
  `isAlert` INTEGER ,
  `created_at` TEXT DEFAULT NULL,
  `updated_at` TEXT DEFAULT NULL, 
  FOREIGN KEY(status_id) REFERENCES status(id),
  FOREIGN KEY(vhl_id) REFERENCES vhls(id),

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

    batch.execute('''

INSERT INTO "vhls" VALUES
	(1, '17079-B-72', '301', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 6, 1, 'JAMAL BOUNAHR' ),
	(2, '232-T-6', 'FIAT ', '', '', '', '', '2021', '', '', '', '', '', 4, 2, 6, 1, 'LAHCEN ACHOUR'),
	(3, '25997-T-6', 'PEUGEOT', '', '', '', '', '2022', '', '', '', '', '', 2, 2, 5, 1, 'REDOUANE NADMY'),
	(4, '26902-B-7', 'DACIA', '', '', '', '', '2020', '', '', '', '', '', 5, 2, 7, 1, 'YOUNESS HAMLI'),
	(5, '26903-B-6', 'DACIA ', '', '', '', '', '2020', '', '', '', '', '', 6, 2, 7, 1, 'ELMILOUDI ABDELHAK'),
	(6, '26905-B-7', 'DACIA', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 7, 1, 'MOURAD ABBOU'),
	(7, '26906-B-6', 'DACIA', '', '', '', '', '2020', '', '', '', '', '', 2, 2, 7, 1, 'ANEJAR RACHID'),
	(8, '27135-B-7', 'DACIA', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 7, 1, 'ALI BICHER HATTABOU'),
	(9, '31577-T-6', 'Fiat doblo panorama', '', '', '', '', '2020', '', '', '', '', '', 2, 2, 5, 1, 'JADIR ABDELATIF'),
	(10, '31578-T-6', 'Fiat doblo panorama', '', '', '', '', '2020', '', '', '', '', '', 2, 2, 5, 1, 'JAMAL MOHAMED'),
	(11, '31587-T-6', 'CITROEN', '', '', '', '', '2022', '', '', '', '', '', 4, 2, 5, 1, 'HASSAN MLY MEHZI'),
	(12, '31588-D-6', 'CITROEN', '', '', '', '', '2022', '', '', '', '', '', 5, 2, 5, 1, 'GLABI SOUFIANE'),
	(13, '31589-T-6', 'CITROEN ', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 5, 1, 'MUSTAPHA BENKAARACH'),
	(14, '31590-T-6', 'CITROEN ', '', '', '', '', '2022', '', '', '', '', '', 1, 2, 5, 1, 'BOURIDA MOHAMED'),
	(15, '31591-T-6', 'CITROEN ', '', '', '', '', '2022', '', '', '', '', '', 1, 2, 5, 1, 'MISSI MOHAMED '),
	(16, '31592-T-6', 'FIAT', '', '', '', '', '2022', '', '', '', '', '', 1, 2, 5, 1, 'HAMID BADDOU'),
	(17, '31593-T-6', 'CITROEN BERLINGO', '', '', '', '', '2022', '', '', '', '', '', 6, 2, 5, 1, 'BYJAOUANE MOHAMMED'),
	(18, '31594-T-6', 'FIAT ', '', '', '', '', '2020', '', '', '', '', '', 3, 2, 5, 1, 'EL GHARS RACHID'),
	(19, '31595-T-6', 'Fiat doblo panorama', '', '', '', '', '2020', '', '', '', '', '', 2, 2, 5, 1, 'IDRISSI MOHAMED'),
	(20, '31596-T-6', 'Fiat doblo panorama', '', '', '', '', '2020', '', '', '', '', '', 2, 2, 5, 1, 'REDOUANE JAMAL'),
	(21, '31599-T-6', 'FIAT', '', '', '', '', '2022', '', '', '', '', '', 1, 2, 5, 1, 'RABIA BAIBY'),
	(22, '31606-T-6', 'CITROEN ', '', '', '', '', '2022', '', '', '', '', '', 1, 2, 5, 1, 'LAHKIM ZAKARIA' ),
	(23, '44355-B-7', 'CITROEN ', '', '', '', '', '2022', '', '', '', '', '', 1, 2, 7, 1, 'ACHRAF EZZABDI' ),
	(24, '44356-B-7', 'CITROEN ', '', '', '', '', '2022', '', '', '', '', '', 1, 2, 7, 1, 'RAFIK AIT EL BEZ' ),
	(25, '44359-B-7', 'CITROEN ', '', '', '', '', '2022', '', '', '', '', '', 1, 2, 7, 1, 'ETTAZY ABDERRAHIM' ),
	(26, '44361-B-7', 'FIAT', '', '', '', '', '2022', '', '', '', '', '', 7, 2, 7, 1, 'SAISSI HASSAN'),
	(27, '47681-D-8', 'PEUGEOT', '', '', '', '', '2021', '', '', '', '', '', 1, 2, 12, 1, 'OUGGAG MUSTAPHA'),
	(28, '47682-D-8', 'PEUGEOT', '', '', '', '', '2021', '', '', '', '', '', 5, 2, 12, 1, 'SOBTI LAKBIR'),
	(29, '47689-D-8', 'PEUGEOT', '', '', '', '', '2021', '', '', '', '', '', 3, 2, 12, 1, 'ABOUZAID HICHAM'),
	(30, '55534-E-6', 'PEUGEOT', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 8, 1, 'EL MAHDAOUY ABDELFATTAH' ),
	(31, '55536-E-6', 'PEUGEOT', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 5, 1, 'MOHAMD TIMOULAL'),
	(32, '55951-E-6', 'PEUGEOT', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 8, 1, 'TIJANI MOHAMED'),
	(33, '57364-E-6', 'DACIA', '', '', '', '', '2019', '', '', '', '', '', 3, 2, 8, 1, 'ELBASRI HICHAM'),
	(34, '57365-E-6', 'DACIA ', '', '', '', '', '2019', '', '', '', '', '', 2, 2, 8, 1, 'ZOUINI SALEH'),
	(35, '57366-E-6', 'DACIA', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 8, 1, 'KARBOUAI YOUNESS'),
	(36, '57367-E-6', 'DACIA', '', '', '', '', '2019', '', '', '', '', '', 7, 2, 8, 1, 'DRAI AZIZ'),
	(37, '57368-E-6', 'DACIA ', '', '', '', '', '2019', '', '', '', '', '', 2, 2, 8, 1, 'HOUMINI MOHAMED'),
	(38, '57369-E-6', 'DACIA', '', '', '', '', '2019', '', '', '', '', '', 5, 2, 8, 1, 'MAAROUF ABDELGHANI'),
	(39, '57370-E-6', 'DACIA', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 8, 1, 'MOSSADEQ ANAS'),
	(40, '57371-E-6', 'DACIA', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 8, 1, 'LHOUCINE AIT DAOUD'),
	(41, '57374-E-6', 'DACIA', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 8, 1, 'EL KAILANI KHALID'),
	(42, '57408-E-6', 'DACIA', '', '', '', '', '2019', '', '', '', '', '', 3, 2, 8, 1, 'IDRISSI ABDELLATIF'),
	(43, '57910-E-6', 'DACIA ', '', '', '', '', '2019', '', '', '', '', '', 2, 2, 5, 1, 'KHADMAOUI NOUREDDINE'),
	(44, '58362-E-6', 'DACIA', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 8, 1, 'HAMID EL MANDOUR'),
	(45, '58378-E-6', 'DACIA', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 8, 1, 'MOHAMED AMINE TLEMCENY'),
	(46, '59019-E-6', 'FIAT', '', '', '', '', '2019', '', '', '', '', '', 7, 2, 8, 1, 'LAZSIRI AZIZ'),
	(47, '59020-E-6', 'FIAT', '', '', '', '', '2019', '', '', '', '', '', 8, 2, 8, 1, 'BENSGHIR DRISS'),
	(48, '59021-E-6', 'FIAT', '', '', '', '', '2019', '', '', '', '', '', 2, 2, 8, 1, 'YASSINE HAMIDA'),
	(49, '59022-E-6', 'FIAT', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 8, 1, 'DAOUI YOUNESS'),
	(50, '6008-T-6', 'FIAT ', '', '', '', '', '2021', '', '', '', '', '', 4, 2, 5, 1, 'AJDAR MUSTAPHA'),
	(51, '6010-T-6', 'FIAT ', '', '', '', '', '2021', '', '', '', '', '', 4, 2, 5, 1, 'GHOUBY SMAIL'),
	(52, '61336-E-6', 'FIAT', '', '', '', '', '2019', '', '', '', '', '', 2, 2, 8, 1, 'BENAKA LAHCEN'),
	(53, '61337-E-6', 'FIAT ', '', '', '', '', '2019', '', '', '', '', '', 3, 2, 8, 1, 'BOUSSELAM MUSTAPHA'),
	(54, '61338-E-6', 'FIAT', '', '', '', '', '2019', '', '', '', '', '', 1, 2, 8, 1, 'MJID LAHJILI'),
	(55, '61339-E-6', 'FIAT', '', '', '', '', '2019', '', '', '', '', '', 2, 2, 8, 1, 'MOUJIB MOHAMED'),
	(56, '61340-E-6', 'FIAT', '', '', '', '', '2019', '', '', '', '', '', 7, 2, 8, 1, 'ABBOUD EL MOSTAPHA'),
	(57, '761-T-6', 'DACIA ', '', '', '', '', '2021', '', '', '', '', '', 1, 2, 5, 1, 'ISMAIL AITSGHIR' ),
	(58, '762-T-6', 'DACIA', '', '', '', '', '2021', '', '', '', '', '', 8, 2, 5, 1, 'EL HOUARI SAID'),
	(59, '78975-E-6', 'VOLGSWAGEN', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 5, 1, 'SOUANI ABDERRAHMAN'),
	(60, '79623-E-6', 'PEUGEOT', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 5, 1, 'med boulahcen'),
	(61, '83683-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 8, 2, 5, 1, 'NAFAA HAMID'),
	(62, '83684-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 2, 2, 5, 1, 'AQUABA JAMAL'),
	(63, '83685-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 5, 1, 'EL BAOUI HASSAN'),
	(64, '83686-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 5, 1, 'SOUHDI MUSTAPHA'),
	(65, '83687-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 5, 2, 5, 1, 'EL GOUNTARI HICHAM'),
	(66, '83688-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 6, 2, 5, 1, 'ABDELLAH DEBANI'),
	(67, '83939-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 8, 2, 5, 1, 'BOUZROUD OMAR'),
	(68, '83940-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 5, 1, 'SADIK ABDELAZIZ'),
	(69, '83941-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 5, 1, 'DEMHOUL HAMID'),
	(70, '84415-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 8, 2, 5, 1, 'TOUAMI RACHID'),
	(71, '85-T-6', 'FIAT ', '', '', '', '', '2021', '', '', '', '', '', 4, 2, 5, 1, 'YOUSSEF ABDEDDINE'),
	(72, '85048-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 1, 2, 5, 1, 'ABDERRAHIM SEMLALY'),
	(73, '85154-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 3, 2, 5, 1, 'JALAL KAMAL'),
	(74, '85155-E-6', 'Citroen', '', '', '', '', '2020', '', '', '', '', '', 2, 2, 5, 1, 'HOUSNI MUSTAPHA'),
	(75, '6-023368', 'Kymco', '', '', 'LC2U60050J5400701', '', '2018', '', '', '', '', '', 1, 3, 5, 1, 'En Arret À Marrakech Accidente'),
	(76, '6-023163', 'Kymco', '', '', 'LC2U60050J5400377', '', '2019', '', '', '', '', '', 1, 3, 5, 1, 'En Arret À Marrakech'),
	(77, '6-038602', 'Kymco', '', '', 'LC2U60050L5400877', '', '2020', '', '', '', '', '', 2, 3, 5, 1, 'AGHRIB LAHCEN'),
	(78, '6-031540', 'Kymco', '', '', 'LC2U60050K5400839', '', '2019', '', '', '', '', '', 1, 3, 5, 1, 'Benqraach Adil arret a azli'),
	(79, '6-038610', 'Kymco', '', '', 'LC2U60050L5400799', '', '2020', '', '', '', '', '', 2, 3, 5, 1, 'IDDAR MUSTAPHA'),
	(80, '6-038626', 'Kymco', '', '', 'LC2U60050L5400829', '', '2020', '', '', '', '', '', 2, 3, 5, 1, 'Tarfaoui Bader'),
	(81, '6-038620', 'Kymco', '', '', 'LC2U60050L5400797', '', '2020', '', '', '', '', '', 6, 3, 5, 1,' AYOUB RACHIQ'),
	(82, '6-038624', 'Kymco', '', '', 'LC2U60050L5400776', '', '2020', '', '', '', '', '', 6, 3, 5, 1, 'LAAOUINI MED'),
	(83, '6-038603', 'Kymco', '', '', 'LC2U60050L5400734', '', '2020', '', '', '', '', '', 3, 3, 5, 1, 'Saghni Fouad'),
	(84, '6-038616', 'Kymco', '', '', 'LC2U60050L5400750', '', '2020', '', '', '', '', '', 3, 3, 5, 1,' BEN ALLAL IMAD'),
	(85, '6-038622', 'Kymco', '', '', 'LC2U60050L5400999', '', '2020', '', '', '', '', '', 3, 3, 5, 1, 'Manqouri Hicham'),
	(86, '6-031495', 'Kymco', '', '', 'LC2U60050K5400882', '', '2019', '', '', '', '', '', 1, 3, 5, 1, 'remplacent accident lahrifi abdellah'),
	(87, '6-038625', 'Kymco', '', '', 'LC2U60050L5400764', '', '2020', '', '', '', '', '', 4, 3, 5, 1,' OUDDOU BRAHIM'),
	(88, '6-038623', 'Kymco', '', '', 'LC2U60050L5400792', '', '2020', '', '', '', '', '', 5, 3, 5, 1, 'ZOUKAL AMINE'),
	(89, '6-038619', 'Kymco', '', '', 'LC2U60050L5400735', '', '2020', '', '', '', '', '', 7, 3, 5, 1, 'AZIZ ESSALMI'),
	(90, '6-046809', 'Kymco', '', '', 'LC2U60050M5400961', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'sridi 2023'),
	(91, '6-049078', 'Kymco', '', '', 'LC2U60050M5401879', '', '2021', '', '', '', '', '', 5, 3, 5, 1, 'ZAKARIA BERRAD' ),
	(92, '6-049080', 'Kymco', '', '', 'LC2U60050M5401555', '', '2021', '', '', '', '', '', 5, 3, 5, 1, 'NAJI MOHAMMED'),
	(93, '6-049082', 'Kymco', '', '', 'LC2U60050M5401465', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Hilmi Youness'),
	(94, '6-049083', 'Kymco', '', '', 'LC2U60050M5401566', '', '2021', '', '', '', '', '', 7, 3, 5, 1, 'Sobti Jamal'),
	(95, '6-049084', 'Kymco', '', '', 'LC2U60050M5401605', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Soufiane Ait Oufkir'),
	(96, '6-049088', 'Kymco', '', '', 'LC2U60050M5401637', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Minaoui Hassan'),
	(97, '6-049091', 'Kymco', '', '', 'LC2U60050M5401594', '', '2021', '', '', '', '', '', 2, 3, 5, 1, 'HILAL A MOUTALIB'),
	(98, '6-049096', 'Kymco', '', '', 'LC2U60050M5401635', '', '2021', '', '', '', '', '', 5, 3, 5, 1, 'LAHLOU ABDELFETTAH'),
	(99, '6-049100', 'Kymco', '', '', 'LC2U60050M5401365', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Hannouri El Houssein'),
	(100, '6-049101', 'Kymco', '', '', 'LC2U60050M5401402', '', '2021', '', '', '', '', '', 2, 3, 5, 1, 'EL MAKHFI NAJIB'),
	(101, '6-049103', 'Kymco', '', '', 'LC2U60050M5401428', '', '2021', '', '', '', '', '', 4, 3, 5, 1, 'El Ourguie Mouhamed'),
	(102, '6-049107', 'Kymco', '', '', 'LC2U60050M5401595', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Boukiri Mohamed'),
	(103, '6-049110', 'Kymco', '', '', 'LC2U60050M5402038', '', '2021', '', '', '', '', '', 3, 3, 5, 1, 'El Ghazi Ilyass'),
	(104, '6-049119', 'Kymco', '', '', 'LC2U60050M5401470', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Souhdi Mhamed'),
	(105, '6-049120', 'Kymco', '', '', 'LC2U60050M5401606', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Laouini Abdeaziz'),
	(106, '6-049121', 'Kymco', '', '', 'LC2U60050M5401394', '', '2021', '', '', '', '', '', 3, 3, 5, 1, 'Bouqssid Abde Rrazak'),
	(107, '6-049122', 'Kymco', '', '', 'LC2U60050M5402053', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Lahraifi Abdellah en arret à azli'),
	(108, '6-049123', 'Kymco', '', '', 'LC2U60050M5402085', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Ben Aami Mustapha' ),
	(109, '6-049124', 'Kymco', '', '', 'LC2U60050M5401608', '', '2021', '', '', '', '', '', 6, 3, 5, 1, 'EL BOUCHRA MED'),
	(110, '6-049128', 'Kymco', '', '', 'LC2U60050M5402052', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Aadani Mohamed'),
	(111, '6-049130', 'Kymco', '', '', 'LC2U60050M5401569', '', '2021', '', '', '', '', '', 8, 3, 5, 1, 'Baoui Fouad'),
	(112, '6-049132', 'Kymco', '', '', 'LC2U60050M5401651', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Mehdi Sraidi'),
	(113, '6-049133', 'Kymco', '', '', 'LC2U60050M5401324', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Moulay Essaid Sarsar'),
	(114, '6-049134', 'Kymco', '', '', 'LC2U60050M5401689', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Hilmi Ibrahim'),
	(115, '6-049135', 'Kymco', '', '', 'LC2U60050M5401321', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Adil Nassihi'),
	(116, '6-049138', 'Kymco', '', '', 'LC2U60050M5401398', '', '2021', '', '', '', '', '', 3, 3, 5, 1, 'Afqir Abdelaziz'),
	(117, '6-049142', 'Kymco', '', '', 'LC2U60050M5402068', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'El Basry Mly Kassem'),
	(118, '6-049146', 'Kymco', '', '', 'LC2U60050M5401643', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'EL BIARI SAID en arret à azli'),
	(119, '6-049150', 'Kymco', '', '', 'LC2U60050M5401495', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Charqaoui Ahmed'),
	(120, '6-049151', 'Kymco', '', '', 'LC2U60050M5401401', '', '2021', '', '', '', '', '', 4, 3, 5, 1, 'Rachid Joudar'),
	(121, '6-049156', 'Kymco', '', '', 'LC2U60050M5401644', '', '2021', '', '', '', '', '', 5, 3, 5, 1, 'CHAACHOUAA ABDELAZIZE'),
	(122, '6-049158', 'Kymco', '', '', 'LC2U60050M5401646', '', '2021', '', '', '', '', '', 5, 3, 5, 1, 'RAFIQ MOHAMMED' ),
	(123, '6-049167', 'Kymco', '', '', 'LC2U60050M5401568', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Aazouzi Mohamed' ),
	(124, '6-049170', 'Kymco', '', '', 'LC2U60050M5401647', '', '2021', '', '', '', '', '', 5, 3, 5, 1, 'FIRDAOUS HICHAM'),
	(125, '6-049176', 'Kymco', '', '', 'LC2U60050M5401095', '', '2021', '', '', '', '', '', 1, 3, 5, 1, 'Ichanti Lahoucine'),
	(126, '6-049761', 'Kymco', '', '', 'LC2U60050M5401607', '', '2021', '', '', '', '', '', 4, 3, 5, 1, 'Hassan Mly Mehzi'),
	(127, '6-049764', 'Kymco', '', '', 'LC2U60050M5401601', '', '2021', '', '', '', '', '', 4, 3, 5, 1, 'El Moumni Mouhamed'),
	(128, '6-049774', 'Kymco', '', '', 'LC2U60050M5401701', '', '2021', '', '', '', '', '', 4, 3, 5, 1, 'Youssef Lmhadi'),
	(129, '6-049780', 'Kymco', '', '', 'LC2U60050M5401924', '', '2022', '', '', '', '', '', 3, 3, 5, 1, 'SALIM ABDE RRAHIM'),
	(130, '6-049802', 'Kymco', '', '', 'LC2U60050M5401711', '', '2022', '', '', '', '', '', 3, 3, 5, 1, 'GUENNANI AYOUB'),
	(131, '6-049805', 'Kymco', '', '', 'LC2U60050M5401903', '', '2022', '', '', '', '', '', 3, 3, 5, 1, 'EZZEBDI RACHID'),
	(132, '6-049807', 'Kymco', '', '', 'LC2U60050M5402000', '', '2022', '', '', '', '', '', 6, 3, 5, 1, 'HASSAN AHOUJEGAL' ),
	(133, '6-055548', 'Kymco', '', '', 'LC2U60050N5401091', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'non affecté'),
	(134, '6-055550', 'Kymco', '', '', 'LC2U60050N5401105', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'Abdelghani Aouzal'),
	(135, '6-055562', 'Kymco', '', '', 'LC2U60050N5401066', '', '2022', '', '', '', '', '', 2, 3, 5, 1, 'RAKKAB OSSAMA'),
	(136, '6-055563', 'Kymco', '', '', 'LC2U60050N5401053', '', '2022', '', '', '', '', '', 2, 3, 5, 1, 'EL KODI HAFID'),
	(137, '6-055564', 'Kymco', '', '', 'LC2U60050N5401071', '', '2022', '', '', '', '', '', 3, 3, 5, 1, 'non affecté'),
	(138, '6-055565', 'Kymco', '', '', 'LC2U60050N5401064', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'Aissam Bouchouka'),
	(139, '6-055566', 'Kymco', '', '', 'LC2U60050N5401093', '', '2022', '', '', '', '', '', 8, 3, 5, 1, 'Touami Rachid'),
	(140, '6-055567', 'Kymco', '', '', 'LC2U60050N5401044', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'Benqraach Adil'),
	(141, '6-055568', 'Kymco', '', '', 'LC2U60050N5401041', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'Defyami Rachid' ),
	(142, '6-055569', 'Kymco', '', '', 'LC2U60050N5401097', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'Jalal Bouloujour'),
	(143, '6-055570', 'Kymco', '', '', 'LC2U60050N5401072', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'Chouib Abdelghani'),
	(144, '6-055571', 'Kymco', '', '', 'LC2U60050N5401104', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'Lahcen El Khalifi'),
	(145, '6-055572', 'Kymco', '', '', 'LC2U60050N5401067', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'Hicham Zerbane' ),
	(146, '6-055573', 'Kymco', '', '', 'LC2U60050N5401087', '', '2022', '', '', '', '', '', 5, 3, 5, 1, 'TAHA YAHCINE'),
	(147, '6-055574', 'Kymco', '', '', 'LC2U60050N5401118', '', '2022', '', '', '', '', '', 5, 3, 5, 1, 'Redouane El Maazouzi'),
	(148, '6-055578', 'Kymco', '', '', 'LC2U60050N5401074', '', '2022', '', '', '', '', '', 7, 3, 5, 1, 'SAISSI HASSANI ISMAIL'),
	(149, '6-058016', 'Kymco', '', '', 'LC2U60050N5401107', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'BABAZIA ADIL'),
	(150, '6-058017', 'Kymco', '', '', 'LC2U60050N5400912', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'Dahibi Mehdi'),
	(151, '6-058018', 'Kymco', '', '', 'LC2U60050N5400923', '', '2022', '', '', '', '', '', 4, 3, 5, 1, 'lahcen belhou'),
	(152, '6-058019', 'Kymco', '', '', 'LC2U60050N5401010', '', '2022', '', '', '', '', '', 8, 3, 5, 1, 'BELKHADEM AHMED'),
	(153, '6-058020', 'Kymco', '', '', 'LC2U60050N5400971', '', '2022', '', '', '', '', '', 1, 3, 5, 1, 'DEBIANI MOHAMED'),
	(154, '13720-A-40', 'RENAULT', '', '', '', '15', '06/05/1996', '', '', '', '', '', 3, 1, 1, 2, 'Khouribga'),
	(155, '42581-A-15', 'MAN', '', '', '', '15', '', '', '', '', '', '', 3, 1, 3, 2, 'Khouribga'),
	(156, '16565-B-7', 'FUSO', '', '', '', '', '18/04/2019', '', '', '', '', '', 2, 1, 10, 2, 'Beni Mellal'),
	(157, '17124-B-7', 'MITSUBI', '', '', '', '', '25/04/2019', '', '', '', '', '', 8, 1, 10, 2, 'El Kelaa'),
	(158, '31935-D-8', 'IVECO', '', '', '', '16', '13/12/2019', '', '', '', '', '', 3, 1, 11, 2, 'Khouribga'),
	(159, '31940-D-8', 'IVECO', '', '', '', '16', '13/12/2019', '', '', '', '', '', 8, 1, 11, 2, 'El Kelaa'),
	(160, '32093-A-26', 'Mitsubishi', '', '', '', '20', '30/06/2004', '', '', '', '', '', 1, 1, 2, 2, 'Marrakech'),
	(161, '32724-A-13', 'MITSUBISHI', '', '', '', '18', '04/03/2013', '', '', '', '', '', 2, 1, 1, 2, 'Beni Mellal'),
	(162, '33248-A-13', 'MITSUBI', '', '', '', '18', '15/04/2013', '', '', '', '', '', 5, 1, 1, 2, 'Safi'),
	(163, '33250-A-13', 'MITSUBISHI', '', '', '', '18', '14/05/2013', '', '', '', '', '', 2, 1, 1, 2, 'Beni Mellal'),
	(164, '3543-A-26', 'Isuzu', '', '', '', '19', '05/05/2000', '', '', '', '', '', 3, 1, 2, 2, 'Khouribga'),
	(165, '3544-A-26', 'ISUZU', '', '', '', '19', '05/05/2000', '', '', '', '', '', 3, 1, 2, 2, 'Khouribga'),
	(166, '3946-A-26', 'MITSUBISHI', '', '', '', '18', '13/06/2000', '', '', '', '', '', 5, 1, 2, 2, 'Safi'),
	(167, '3947-A-26', 'MITSUBICHI FK', '', '', '', '18', '13/06/2000', '', '', '', '', '', 8, 1, 2, 2, 'El Kelaa'),
	(168, '4001-A-7', 'ISUZU', '', '', '', '19', '05/06/2000', '', '', '', '', '', 3, 1, 1, 2, 'Khouribga'),
	(169, '56169-E-6', 'MITSUBICHI', '', '', '', '20', '13/07/2019', '', '', '', '', '', 2, 1, 8, 2, 'Beni Mellal'),
	(170, '56172-E-6', 'FUSO', '', '', '', '20', '13/07/2019', '', '', '', '', '', 5, 1, 8, 2, 'Safi'),
	(171, '56405-E-6', 'FUSO', '', '', '', '20', '02/07/2019', '', '', '', '', '', 2, 1, 8, 2, 'Beni Mellal'),
	(172, '56407-E-6', 'FUSO', '', '', '', '20', '02/07/2019', '', '', '', '', '', 5, 1, 8, 2, 'Safi'),
	(173, '56408-E-6', 'FUSO', '', '', '', '20', '02/07/2019', '', '', '', '', '', 5, 1, 8, 2, 'Safi'),
	(174, '56409-E-6', 'FUSO', '', '', '', '20', '02/07/2019', '', '', '', '', '', 2, 1, 8, 2, 'Beni Mellal'),
	(175, '5951-A-6', 'RENAULT ', '', '', '', '17', '22/03/2000', '', '', '', '', '', 3, 1, 4, 2, 'Khouribga'),
	(176, '59749-E-6', 'MITSUBICHI', '', '', '', '20', '23/09/2019', '', '', '', '', '', 4, 1, 5, 2, 'Ouarzazate'),
	(177, '59750-E-6', 'FUSO', '', '', '', '20', '23/09/2019', '', '', '', '', '', 5, 1, 5, 2, 'Safi'),
	(178, '59751-E-6', 'MITSUBICHI', '', '', '', '20', '23/09/2019', '', '', '', '', '', 4, 1, 5, 2, 'Ouarzazate'),
	(179, '59752-E-6', 'MITSUBICHI', '', '', '', '20', '23/09/2019', '', '', '', '', '', 4, 1, 5, 2, 'Ouarzazate'),
	(180, '59753-E-6', 'MITSUBICHI', '', '', '', '20', '23/09/2019', '', '', '', '', '', 4, 1, 5, 2, 'Ouarzazate'),
	(181, '59754-E-6', 'FUSO', '', '', '', '20', '23/09/2019', '', '', '', '', '', 4, 1, 5, 2, 'Ouarzazate'),
	(182, '59755-E-6', 'MITSUBI', '', '', '', '20', '23/09/2019', '', '', '', '', '', 2, 1, 5, 2, 'Beni Mellal'),
	(183, '60368-A-13', 'TRAIPORTEUR', '', '', '', '', '', '', '', '', '', '', 5, 1, 1, 2, 'Safi'),
	(184, '60370-A-13', 'TRAIPORTEUR', '', '', '', '', '', '', '', '', '', '', 5, 1, 1, 2, 'Safi'),
	(185, '60539-E-6', 'MITSUBICHI', '', '', '', '20', '23/09/2019', '', '', '', '', '', 4, 1, 5, 2, 'Ouarzazate'),
	(186, '60540-E-6', 'MITSUBISHI', '', '', '', '20', '23/09/2019', '', '', '', '', '', 2, 1, 5, 2, 'Beni Mellal'),
	(187, '60541-E-6', 'FUSO', '', '', '', '20', '23/09/2019', '', '', '', '', '', 5, 1, 5, 2, 'Safi'),
	(188, '60542-E-6', 'FUSO', '', '', '', '20', '23/09/2019', '', '', '', '', '', 5, 1, 5, 2, 'Safi'),
	(189, '60543-E-6', 'Mitsub', '', '', '', '20', '23/09/2019', '', '', '', '', '', 3, 1, 5, 2, 'Khouribga'),
	(190, '60544-E-6', 'FUSO', '', '', '', '20', '23/09/2019', '', '', '', '', '', 2, 1, 5, 2, 'Beni Mellal'),
	(191, '6443-A-7', 'RENAULT', '', '', '', '17', '20/09/2000', '', '', '', '', '', 3, 1, 1, 2, 'Khouribga'),
	(192, '6658-A-2', 'RENAULT', '', '', '', '15', '23/06/1998', '', '', '', '', '', 3, 1, 1, 2, 'Khouribga'),
	(193, '71131-A-26', 'Mitsubishi', '', '', '', '18', '21/04/2009', '', '', '', '', '', 9, 1, 2, 2, 'Ain Harrouda'),
	(194, '81080-B-8', 'MITSUBICHI ', '', '', '', '13', '09/06/2014', '', '', '', '', '', 2, 1, 11, 2, 'Beni Mellal'),
	(195, '84690-B-8', 'MITSUBISHI', '', '', '', '13', '19/02/2018', '', '', '', '', '', 2, 1, 11, 2, 'Beni Mellal'),
	(196, '84705-A-26', 'Isuzu', '', '', '', '15', '21/07/1998', '', '', '', '', '', 9, 1, 2, 2, 'Ain Harrouda'),
	(197, '85241-B-8', 'MITSUBISHI', '', '', '', '13', '09/06/2014', '', '', '', '', '', 2, 1, 11, 2, 'Beni Mellal'),
	(198, '85251-B-8', 'ISUZU', '', '', '', '15', '09/06/2014', '', '', '', '', '', 4, 1, 11, 2, 'Ouarzazate'),
	(199, '85253-B-8', 'ISUZU', '', '', '', '15', '09/06/2014', '', '', '', '', '', 5, 1, 11, 2, 'Safi'),
	(200, '85260-B-8', 'MITSUBISHI', '', '', '', '13', '09/06/2014', '', '', '', '', '', 3, 1, 11, 2, 'Khouribga'),
	(201, '86064-B-8', 'MITSUBICHI ', '', '', '', '15', '05/08/2014', '', '', '', '', '', 2, 1, 11, 2, 'Beni Mellal'),
	(202, '86253-B-8', 'ISUZU', '', '', '', '15', '09/08/2014', '', '', '', '', '', 5, 1, 11, 2, 'Safi'),
	(203, '86255-B-8', 'ISUZU', '', '', '', '15', '09/08/2014', '', '', '', '', '', 3, 1, 11, 2, 'Khouribga'),
	(204, '86567-B-8-', 'ISUZU', '', '', '', '15', '02/09/2014', '', '', '', '', '', 2, 1, 11, 2, 'Beni Mellal'),
	(205, '88265-A-8', 'RENAULT ', '', '', '', '17', '13/03/2003', '', '', '', '', '', 3, 1, 1, 2, 'Khouribga'),
	(206, '88274-A-8', 'RENAULT ', '', '', '', '17', '13/03/2003', '', '', '', '', '', 3, 1, 1, 2, 'Khouribga'),
	(207, '92333-B-26', 'Mitsubishi', '', '', '', '11', '15/01/1997', '', '', '', '', '', 1, 1, 2, 2, 'Marrakech'),
	(208, '9978-A-13', 'RENAULT ', '', '', '', '17', '20/06/2005', '', '', '', '', '', 3, 1, 1, 2, 'Khouribga'),
	(209, '217', 'Toyota', 'FDZN25', '', 'FDZN25-23634', '2,5', '2015', '', '', '', '', '', 1, 4, 9, 3,''),
	(210, '219', 'Toyota', '02-8FDL25', '', '8FDL25-31760', '2,5', '2012', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(211, '220', 'Toyota', '02-8FDL25', '', '8FDL25-31757', '2,5', '2012', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(212, '223', 'Toyota', '02-8FDL25', '', '8FDL25-31755', '2,5', '2012', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(213, '224', 'Toyota', '608FD25', '', '608FD25-66980', '2,5', '2017', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(214, '306', 'Toyota', '62-8FD25', '', '8FD25-83386', '2,5', '2022', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(215, '310', 'Toyota', '608FD25', '', '608FD25-83455', '2', '2022', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(216, '312', 'Toyota', '608FD25', '', '608FD25-84326', '2,5', '2022', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(217, '314', 'Toyota', '608FD25', '', '608FD25-84359', '2,5', '2022', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(218, '315', 'Toyota', '608FD25', '', '608FD25-84266', '2,5', '2022', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(219, '316', 'Toyota', '608FD25', '', '608FD25-84267', '2,5', '2022', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(220, '319', 'Toyota', '608FD25', '', '608FD25-84311', '2,5', '2022', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(221, '320', 'Toyota', '608FD25', '', '608FD25-84293', '2,5', '2022', '', '', '', '', '', 1, 4, 9, 3, ''),
	(222, '321', 'Toyota', '608FD25', '', '608FD25-84157', '2,5', '2022', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(223, '278', 'TCM', 'FB25-8', '', '7P442057', '2,5', '2019', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(224, '279', 'Toyota', '8FBEKT16', '', '8FBEKT16-11323', '1,6', '2012', '', '', '', '', '', 1, 4, 9, 3,'' ),
	(225, '311', 'Nacelle', 'ML10EJ', '', 'ML10EJ-0900200238', '2,3', '2022', '', '', '', '', '', 1, 4, 9, 4,'' )


''');

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

//("id", "matricule", "marque", "type", "ww", "chassis", "puissance", "date_mc", "equipement", "observation", "deleted_at", "created_at", "updated_at", "agence_id", "categorie_id", "intitule_id", "service_id", "utilisateur")
