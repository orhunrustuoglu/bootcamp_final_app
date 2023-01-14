import 'package:bootcamp_final_app/data/entitiy/meal.dart';
import 'package:bootcamp_final_app/ui/components/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/entitiy/meals_response.dart';
import '../../../cubit/home_screen_cubit.dart';

class MealsTab extends StatefulWidget {
  const MealsTab({super.key});

  @override
  State<MealsTab> createState() => _MealsTabState();
}

class _MealsTabState extends State<MealsTab> {
  @override
  void initState() {
    super.initState();
    context.read<HomeScreenCubit>().getMeals();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, MealsResponse>(
        builder: (context, mealsResponse) {
      List<Meal> meals = mealsResponse.meals;
      if (mealsResponse.success == 0) {
        return const Center(child: CircularProgressIndicator.adaptive());
      } else {
        return ListView.builder(
            itemCount: meals.length,
            itemBuilder: ((context, index) => MealCard(meal: meals[index])));
      }
    });
  }
}
