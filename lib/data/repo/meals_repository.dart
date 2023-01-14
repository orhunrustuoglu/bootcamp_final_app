import 'dart:convert';

import '/data/entitiy/meals_response.dart';
import 'package:http/http.dart' as http;

class MealsRepository {
  Future<MealsResponse> getMeals() async {
    var url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");

    var response = await http.get(url);
    return MealsResponse.fromJson(json.decode(response.body));
  }
}
