import 'package:bootcamp_final_app/data/entitiy/meal.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(meal.name),
    );
  }
}
