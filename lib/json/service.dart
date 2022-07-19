import 'dart:convert';

import 'package:flutter_firebase_auth/json/foodjson.dart';
import 'package:http/http.dart' as http;

List<FoodJson> foodJson = [];
Future<List<FoodJson>> fetchJson() async {
  var reponse = await http
      .get(Uri.parse("https://lephathien.github.io/jsonapi/mydata.json"));
  List<FoodJson> flist = [];
  if (reponse.statusCode == 200) {
    var urjson = jsonDecode(reponse.body);
    for (var jsondata in urjson) {
      flist.add(FoodJson.fromJson(jsondata));
    }
  }
  return flist;
}
