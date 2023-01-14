import 'package:bootcamp_final_app/data/entitiy/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;
  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
    );
  }
}
