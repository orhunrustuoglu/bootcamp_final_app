import 'package:bootcamp_final_app/data/entitiy/cart_meal.dart';
import 'package:bootcamp_final_app/data/entitiy/cart_meals_response.dart';
import 'package:bootcamp_final_app/ui/components/cart_meal_card.dart';
import 'package:bootcamp_final_app/ui/cubit/my_cart_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  void initState() {
    super.initState();
    context.read<MyCartPageCubit>().getCartMeals();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCartPageCubit, CartMealsResponse>(
        builder: (context, mealsResponse) {
      List<CartMeal> cartMeals = mealsResponse.cartMeals;
      if (mealsResponse.success == 0) {
        return const Center(child: CircularProgressIndicator.adaptive());
      } else if (mealsResponse.cartMeals.isEmpty) {
        return const Center(
          child: Text("Your cart is empty..."),
        );
      } else {
        return ListView.builder(
            itemCount: cartMeals.length,
            itemBuilder: ((context, index) =>
                CartMealCard(cartMeal: cartMeals[index])));
      }
    });
  }
}
