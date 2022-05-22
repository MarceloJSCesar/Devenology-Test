import 'dart:async';
import 'db.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Db dbHelper = Db();
  Future<Database> get db => dbHelper.db;
}
