import 'dart:convert';

import 'package:dio/dio.dart';

import '/data/entitiy/cart_meal.dart';

import '/data/entitiy/cart_meals_response.dart';
import 'package:http/http.dart' as http;

class MyCartRepository {
  static const String userName = "orhun_rustuoglu";

  Future<CartMealsResponse> getCartMeals() async {
    var url = Uri.parse(
        "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");

    var response = await http.post(url, body: {"kullanici_adi": userName});
    //the response.body is ["\n","\n","\n","\n","\n"]
    //thanks for the gift Mr. Adalan :)
    if (response.body.contains("success")) {
      return CartMealsResponse.fromJson(json.decode(response.body));
    } else {
      return CartMealsResponse(cartMeals: [], success: 1);
      //success is 1 to alter the showcased UI and
      //also because the http request itself is successful
    }
  }

  Future<void> addToCart(CartMeal cartMeal) async {
    var url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var bodyData = {
      "yemek_adi": cartMeal.name,
      "yemek_resim_adi": cartMeal.imgName,
      "yemek_fiyat": cartMeal.price.toString(),
      "yemek_siparis_adet": cartMeal.amount.toString(),
      "kullanici_adi": userName,
    };
    var response = await http.post(url, body: bodyData);
    print(response.body);
  }

  Future<void> deleteCartMeal(CartMeal cartMeal) async {
    var url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var bodyData = {
      "sepet_yemek_id": cartMeal.id.toString(),
      "kullanici_adi": cartMeal.userName,
    };
    //request is a POST, instead of DELETE?
    var response = await http.post(url, body: bodyData);
    print(response.body);
  }
}
