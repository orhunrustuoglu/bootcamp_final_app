import 'package:bootcamp_final_app/data/entitiy/meal.dart';

import '../../data/entitiy/meals_response.dart';
import '/data/repo/meals_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<MealsResponse> {
  HomeScreenCubit() : super(MealsResponse(meals: []));

  var mRepo = MealsRepository();

  Future<void> getMeals() async {
    var mealsResponse = await mRepo.getMeals();
    emit(mealsResponse);
  }
}
