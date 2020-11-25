import 'dart:async';

import 'package:bloc_rxdart/database/database_helper.dart';
import 'package:bloc_rxdart/model/exampleModel.dart';

import 'pharmacy_api_provider.dart';

class Repository {
  final pharmacyApiProvider = PharmacyApiProvider();
  DatabaseHelper databaseHelper = new DatabaseHelper();

  Future<List<ExampleModel>> fetchExample() =>
      pharmacyApiProvider.fetchExample();

  Future<List<ExampleModel>> databaseItem() => databaseHelper.getProduct();
}
