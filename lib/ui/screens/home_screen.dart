import 'package:bootcamp_final_app/data/entitiy/meal.dart';
import 'package:bootcamp_final_app/data/entitiy/meals_response.dart';
import 'package:bootcamp_final_app/ui/components/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_screen_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeScreenCubit>().getMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Menu")),
        body: BlocBuilder<HomeScreenCubit, MealsResponse>(
            builder: (context, mealsResponse) {
          List<Meal> meals = mealsResponse.meals;
          if (mealsResponse.success == 0) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            return ListView.builder(
                itemCount: meals.length,
                itemBuilder: ((context, index) =>
                    MealCard(meal: meals[index])));
          }
        }));
  }
}
