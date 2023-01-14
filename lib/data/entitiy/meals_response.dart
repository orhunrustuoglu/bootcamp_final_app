import '/data/entitiy/meal.dart';

class MealsResponse {
  List<Meal> meals;
  int success; //web service success status, 0-1

  MealsResponse({required this.meals, this.success = 0});

  factory MealsResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["yemekler"] as List;
    return MealsResponse(
        meals: jsonArray.map((m) => Meal.fromJson(m)).toList(),
        success: json["success"] as int);
  }
}
