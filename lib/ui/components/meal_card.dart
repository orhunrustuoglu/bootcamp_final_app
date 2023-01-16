import 'package:bootcamp_final_app/data/constants/custom_colors.dart';

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
      child: Container(
        width: MediaQuery.of(context).size.width / 2 -
            25, //to roughly even populars and recommendations
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: Image.network(
                "http://kasimadalan.pe.hu/yemekler/resimler/${meal.imgName}",
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
            Text(
              meal.name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: textColorDark),
            ),
            const SizedBox(height: 5),
            Text(
              "${meal.price}₺",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColorLight),
            ),
          ],
        ),
      ),
    );
  }
}
