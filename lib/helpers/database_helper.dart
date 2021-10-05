import 'dart:async';

import 'package:path/path.dart';
import 'package:proschool/helpers/helpers_utils.dart';
import 'package:sqflite/sqflite.dart';

//lastUpdated: DateTime.now().millisecondsSinceEpoch,
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  static initDb() async {
    //io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, "b2bcongobase.db");
    var theDb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return theDb;
  }

  static void _onCreate(Database db, int version) async {
    try {
      //Script de creation de tables
      String sqlAssurance =
          'CREATE TABLE $TABLE_NAME_USER($idUser INTEGER PRIMARY KEY AUTOINCREMENT,$apiIdUser INTEGER,$nom TEXT,$prenoms TEXT,$photo TEXT,$statuts INTEGER)';

      //creation des tables
      await db.execute(sqlAssurance);
    } catch (error) {
      print('error during database creation $error');
    }
  }

  static void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // ignore: empty_catches
    try {} catch (error) {}
  }
}
