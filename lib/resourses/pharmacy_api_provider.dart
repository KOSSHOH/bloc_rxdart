import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_rxdart/model/exampleModel.dart';
import 'package:bloc_rxdart/utils/utils.dart';
import 'package:http/http.dart' as http;

class PharmacyApiProvider {
  HttpClient httpClient = new HttpClient();

  ///Login
  Future<List<ExampleModel>> fetchExample() async {
    String url = Utils.BASE_URL;

    Map<String, String> headers = {'content-type': 'application/json'};

    try {
      http.Response response = await http
          .post(url, headers: headers)
          .timeout(const Duration(seconds: 15));

      return exampleModelFromJson(utf8.decode(response.bodyBytes));
    } on TimeoutException catch (_) {
      return null;
    } on SocketException catch (_) {
      return null;
    }
  }
}
