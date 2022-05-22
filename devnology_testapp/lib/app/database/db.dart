import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../config/app_dbnames.dart';

class Db {
  static final Db _instance = Db.internal();
  factory Db() => _instance;

  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db as Database;
    } else {
      _db = await initDb();
      return _db as Database;
    }
  }

  Db.internal();

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'dbStorage.db');

    return await openDatabase(path, version: 1,
        onCreate: (database, newerVersion) async {
      await database.execute(
        'CREATE TABLE ${AppDbNames.storageTable}(${AppDbNames.id} INTEGER PRIMARY KEY, ${AppDbNames.itemImg} TEXT, ${AppDbNames.itemLabel} TEXT, ${AppDbNames.itemPrice} REAL, ${AppDbNames.itemQuantity} INTEGER)',
      );
    });
  }
}
