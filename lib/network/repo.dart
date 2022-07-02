import 'dart:convert';

import 'package:apicall/Model/model/model.dart';
import 'package:http/http.dart' as http;

const url = 'https://api.escuelajs.co/api/v1/products';

class Repo {
  List<Modelclass> collections = [];
  final http.Client _httpClient;

  Repo({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<List<Modelclass>?> getdata() async {
    try {
      final response = await _httpClient.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List data = json.decode(response.body);
       

        for (var value in data) {
          Modelclass modelclass = Modelclass.fromJson(value);

          collections.add(modelclass);
        }
        return collections;
      }
    } catch (e) {
      throw Dataerror(message: e.toString());
    }
  }
}
