import 'dart:async';

import 'package:bloc_rxdart/model/exampleModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableNote = 'cardTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnManufacturer = 'manufacturer';
  final String columnProductCode = 'productCode';
  final String columnSum = 'sum';
  final String columnPriceInclude = 'priceInclude';
  final String columnAvailability = 'availability';
  final String columnImage = 'image';
  final String columnColor = 'color';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'abror.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $tableNote('
      '$columnId INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$columnName TEXT, '
      '$columnManufacturer TEXT, '
      '$columnProductCode TEXT, '
      '$columnSum REAL, '
      '$columnPriceInclude TEXT, '
      '$columnAvailability INTEGER, '
      '$columnImage TEXT, '
      '$columnColor TEXT)',
    );
  }

  Future<int> saveProducts(ExampleModel item) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableNote, item.toJson());
    return result;
  }

  Future<List<ExampleModel>> getProduct() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableNote');
    List<ExampleModel> products = new List();
    for (int i = 0; i < list.length; i++) {
      var items = new ExampleModel(
        name: list[i][columnName],
        manufacturer: list[i][columnManufacturer],
        productCode: list[i][columnProductCode],
        sum: list[i][columnSum],
        priceInclude: list[i][columnPriceInclude],
        availability: list[i][columnAvailability],
        image: list[i][columnImage],
        color: list[i][columnColor],
      );
      products.add(items);
    }
    return products;
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableNote');
  }
}
