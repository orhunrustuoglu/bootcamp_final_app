import 'package:bootcamp_final_app/data/entitiy/cart_meal.dart';
import 'package:bootcamp_final_app/data/entitiy/cart_meals_response.dart';
import 'package:bootcamp_final_app/data/repo/my_cart_repository.dart';
import 'package:bootcamp_final_app/data/repo/snackbar_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartPageCubit extends Cubit<CartMealsResponse> {
  MyCartPageCubit() : super(CartMealsResponse(cartMeals: []));

  var cMRepo = MyCartRepository();

  Future<void> getCartMeals() async {
    var cartMealsResponse = await cMRepo.getCartMeals();
    emit(cartMealsResponse);
  }

  void confirmDelete(BuildContext context, CartMeal cartMeal) {
    SnackbarRepository.showDeleteSnackbar(context, cartMeal);
  }

  Future<void> deleteCartMeal(CartMeal cartMeal) async {
    await cMRepo.deleteCartMeal(cartMeal);
    getCartMeals();
  }
}
