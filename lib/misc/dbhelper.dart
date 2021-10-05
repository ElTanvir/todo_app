import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _dbName = "hasinaPH.db";
  static const dbVersion = 1;
  static const hfTable = "HFTable";
  static const colID = "_ID";
  static const colTrx = "Trx";
  static const colCustomer = "Customer";

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

  Future<Database> _initiateDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, _dbName);
    // ignore: unnecessary_await_in_return
    return await openDatabase(path, version: dbVersion, onCreate: _onCreateDb);
  }

  Future _onCreateDb(Database db, int version) async {
    db.execute('''
     CREATE TABLE $hfTable ( $colID INTEGER PRIMARY KEY, 
     $colTrx TEXT, $colCustomer TEXT)
     ''');
  }

  Future insert(String message) async {
    final Database db = await instance.database;
    final String trxID = message;

    final Map<String, String> data = {colTrx: trxID, colCustomer: 'none'};
    final b = await db.query(hfTable, where: '$colTrx =?', whereArgs: [trxID]);

    await db.insert(hfTable, data);
  }

  Future<List<Map<String, dynamic>>> queryall() async {
    final Database db = await instance.database;
    final List<Map<String, dynamic>> a = await db.query(hfTable);
    return a;
  }

  Future update(String message, String ctname) async {
    final Database db = await instance.database;
    final String trxID = message;
    final data = {colTrx: trxID, colCustomer: ctname};
    db.update(hfTable, data, where: '$colTrx =?', whereArgs: [trxID]);
  }
}
