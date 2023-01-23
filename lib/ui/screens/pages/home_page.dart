import '/data/constants/animations.dart';
import '/data/constants/custom_colors.dart';
import 'package:lottie/lottie.dart';

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

      //and a little bit of, spice...
      List<Meal> popularMeals = meals.where((m) => m.price >= 25).toList();
      List<Meal> recommendationMeals =
          meals.where((m) => m.price < 25).toList();

      if (mealsResponse.success == 0) {
        return const Center(child: CircularProgressIndicator.adaptive());
      } else if (mealsResponse.meals.isEmpty) {
        return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(nosuchFoodAnimation),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "No such meal!",
                    style: TextStyle(color: textColorLight, fontSize: 16),
                  ),
                )
              ],
            ));
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              if (popularMeals.isNotEmpty)
                const Text(
                  "Popular",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: primaryColor),
                ),
              if (popularMeals.isNotEmpty) const SizedBox(height: 10),
              if (popularMeals.isNotEmpty)
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    itemCount: popularMeals.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: MealCard(meal: popularMeals[index]),
                      );
                    },
                  ),
                ),
              if (popularMeals.isNotEmpty) const SizedBox(height: 30),
              if (recommendationMeals.isNotEmpty)
                const Text(
                  "Recommendations",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: primaryColor),
                ),
              if (recommendationMeals.isNotEmpty) const SizedBox(height: 10),
              if (recommendationMeals.isNotEmpty)
                GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: recommendationMeals
                        .map((m) => MealCard(meal: m))
                        .toList()),
            ],
          ),
        );
      }
    });
  }
}
