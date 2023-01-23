import 'package:bootcamp_final_app/data/constants/custom_colors.dart';
import 'package:bootcamp_final_app/ui/components/my_elevated_button.dart';

import '/data/entitiy/cart_meal.dart';
import '/data/entitiy/meal.dart';
import '/data/repo/my_cart_repository.dart';
import '/ui/cubit/meal_details_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsPage extends StatefulWidget {
  final Meal meal;
  const MealDetailsPage({super.key, required this.meal});

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    Meal meal = widget.meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      body: ListView(
        children: [
          Image.network(
              "http://kasimadalan.pe.hu/yemekler/resimler/${widget.meal.imgName}"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  meal.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: primaryColor.withOpacity(0.2),
                        ),
                        child: Row(children: [
                          TextButton(
                              onPressed: () {
                                if (amount > 1) {
                                  setState(() => amount--);
                                }
                              },
                              style: TextButton.styleFrom(
                                  foregroundColor: primaryColor),
                              child: const Icon(
                                Icons.remove,
                                size: 20,
                              )),
                          SizedBox(
                            width: 15,
                            child: Text(
                              amount.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          TextButton(
                              onPressed: () => setState(() => amount++),
                              style: TextButton.styleFrom(
                                  foregroundColor: primaryColor),
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              )),
                        ])),
                    const Spacer(),
                    Text(
                      "${meal.price}₺",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "Food Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eros urna, bibendum quis justo vel, malesuada fringilla erat. Donec auctor tellus magna, ac sollicitudin purus ultrices sit amet. Donec blandit lorem dolor, non volutpat felis commodo quis. In hac habitasse platea dictumst. Proin feugiat eleifend nisi, ultrices ultrices diam suscipit sit amet.",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyElevatedButton(
                text: "ADD TO CART",
                onPressed: () {
                  var cartMeal = CartMeal(
                      id: widget.meal.id,
                      name: widget.meal.name,
                      imgName: widget.meal.imgName,
                      price: widget.meal.price,
                      amount: amount,
                      userName: MyCartRepository.userName);

                  print(cartMeal.amount);
                  context.read<MealDetailsPageCubit>().addToCart(cartMeal);
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
