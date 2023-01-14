import '/data/entitiy/cart_meal.dart';

class CartMealsResponse {
  List<CartMeal> cartMeals;
  int success; //web service success status, 0-1

  CartMealsResponse({required this.cartMeals, this.success = 0});

  factory CartMealsResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["sepet_yemekler"] as List;
    return CartMealsResponse(
        cartMeals: jsonArray.map((m) => CartMeal.fromJson(m)).toList(),
        success: json["success"] as int);
  }
}
