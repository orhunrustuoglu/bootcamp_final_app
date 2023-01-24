import '/ui/cubit/my_cart_page_cubit.dart';
import 'package:flutter/material.dart';

import '/data/entitiy/cart_meal.dart';
import '/data/repo/my_cart_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsPageCubit extends Cubit<bool> {
  MealDetailsPageCubit() : super(false);

  var cMRepo = MyCartRepository();

  Future<void> addToCart(CartMeal cartMeal) async {
    bool alreadyExists = false;
    int amount = 0;
    var cartMealsResponse = await cMRepo.getCartMeals();

    for (var m in cartMealsResponse.cartMeals) {
      //find if the same meal already exists within the cart
      if (m.name == cartMeal.name) {
        alreadyExists = true;
        amount = m.amount;
        cartMeal.amount += m.amount;
        await cMRepo.deleteCartMeal(m);
      }
      break; //finding one match is enough since every addition goes through this control
    }
    await cMRepo.addToCart(cartMeal);
  }

  void getOrderConfirmed(BuildContext context) {
    if (context.read<MyCartPageCubit>().getOrderConfirmed()) {
      cMRepo.confirmCurrentOrder();
    }
    print(cMRepo.getOrderConfirmed);
    emit(cMRepo.getOrderConfirmed);
  }

  // void showActiveOrderExistsSnackbar(BuildContext context) {
  //   SnackbarRepository.showActiveOrderExistsSnackbar(context);
  // }
}
