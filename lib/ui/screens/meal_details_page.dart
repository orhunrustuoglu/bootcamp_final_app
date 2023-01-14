import 'package:bootcamp_final_app/data/entitiy/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  final Meal meal;
  const MealDetailsPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
    );
  }
}
