import '/ui/cubit/my_cart_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/entitiy/meal.dart';
import '../screens/pages/meal_details_page.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MealDetailsPage(
                  meal: meal,
                )),
      ).then((_) => context.read<MyCartPageCubit>().getCartMeals()),
      child: Card(
        child: ListTile(
          leading: Image.network(
              "http://kasimadalan.pe.hu/yemekler/resimler/${meal.imgName}"),
          title: Text(meal.name),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
