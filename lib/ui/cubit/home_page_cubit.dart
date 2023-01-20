import 'package:bootcamp_final_app/data/entitiy/meal.dart';

import '../../data/entitiy/meals_response.dart';
import '/data/repo/meals_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<MealsResponse> {
  HomePageCubit() : super(MealsResponse(meals: []));

  var mRepo = MealsRepository();

  Future<void> getMeals() async {
    var mealsResponse = await mRepo.getMeals();
    emit(mealsResponse);
  }

  Future<void> search(String query) async {
    var mealsResponse = await mRepo.getMeals();
    mealsResponse.meals = mealsResponse.meals
        .where((m) => m.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(mealsResponse);
  }
}
