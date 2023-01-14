import '../../cubit/home_page_cubit.dart';
import '/data/entitiy/meal.dart';
import '/ui/components/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/entitiy/meals_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().getMeals();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, MealsResponse>(
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
