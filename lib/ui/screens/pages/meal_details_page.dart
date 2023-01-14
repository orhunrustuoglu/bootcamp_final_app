import '/data/entitiy/cart_meal.dart';
import '/data/entitiy/meal.dart';
import '/data/repo/my_cart_repository.dart';
import '/ui/cubit/meal_details_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsPage extends StatelessWidget {
  final Meal meal;
  const MealDetailsPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          var cartMeal = CartMeal(
              id: meal.id,
              name: meal.name,
              imgName: meal.imgName,
              price: meal.price,
              amount: 1,
              userName: MyCartRepository.userName);
          context.read<MealDetailsPageCubit>().addToCart(cartMeal);
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
        child: const Text("ADD TO CART"),
      ),
    );
  }
}
