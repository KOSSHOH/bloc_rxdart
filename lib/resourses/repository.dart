import 'dart:async';

import 'package:bloc_rxdart/model/exampleModel.dart';

import 'pharmacy_api_provider.dart';

class Repository {
  final pharmacyApiProvider = PharmacyApiProvider();

  Future<List<ExampleModel>> fetchExample() =>
      pharmacyApiProvider.fetchExample();
}
