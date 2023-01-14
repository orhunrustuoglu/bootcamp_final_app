import '/data/entitiy/meal.dart';
import '/ui/screens/meal_details_page.dart';
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
      ),
      child: Card(
        child: ListTile(
          title: Text(meal.name),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
