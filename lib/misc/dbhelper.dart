import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _dbName = "hasinaPH.db";
  static final dbVersion = 1;
  static final hfTable = "HFTable";
  static final colID = "_ID";
  static final colTrx = "Trx";
  static final colCustomer = "Customer";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initiateDatabase();
      return _database!;
    }
  }

  _initiateDatabase() async {
    print("DataBase  Init");
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    print(path);
    return await openDatabase(path, version: dbVersion, onCreate: _onCreateDb);
  }

  Future _onCreateDb(Database db, int version) async {
    db.execute('''
     CREATE TABLE $hfTable ( $colID INTEGER PRIMARY KEY, 
     $colTrx TEXT, $colCustomer TEXT)
     ''');
  }

  Future insert(String message) async {
    Database db = await instance.database;
    String trxID = message;

    int a;
    var data = {colTrx: trxID, colCustomer: 'none'};
    var b = await db.query(hfTable, where: '$colTrx =?', whereArgs: [trxID]);

    a = await db.insert(hfTable, data);
  }

  Future<List<Map<String, dynamic>>> queryall() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> a = await db.query(hfTable);
    return a;
  }

  Future update(String message, String ctname) async {
    Database db = await instance.database;
    String trxID = message;
    var data = {colTrx: trxID, colCustomer: ctname};
    db.update(hfTable, data, where: '$colTrx =?', whereArgs: [trxID]);
  }
}
