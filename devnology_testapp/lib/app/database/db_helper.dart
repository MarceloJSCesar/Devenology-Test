import 'dart:async';
import '../models/cart.dart';

import '../config/app_dbnames.dart';
import 'db.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Db dbHelper = Db();
  Future<Database> get db => dbHelper.db;

  Future<int> addItemToCart(Cart cart) async {
    Database database = await db;
    int cartItemId = await database.insert(
      AppDbNames.storageTable,
      cart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('cartItemId: $cartItemId');
    return cartItemId;
  }

  Future<int> delete(int id) async {
    Database database = await db;
    return await database.delete(AppDbNames.storageTable,
        where: '${AppDbNames.id} = ?', whereArgs: [id]);
  }

  Future<List<Cart>> getAllItems() async {
    Database database = await db;
    List<Map> cartItemListFound =
        await database.rawQuery('SELECT * FROM ${AppDbNames.storageTable}');
    List<Cart> cartItemList = [];
    for (Map cart in cartItemListFound) {
      cartItemList.add(Cart.fromMap(cart));
    }
    print(cartItemList);
    return cartItemList;
  }
}
