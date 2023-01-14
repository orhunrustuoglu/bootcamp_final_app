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
                Text(
                  "${meal.price}₺",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(meal.name),
                Text(meal.name),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          color: Colors.white,
          child: SafeArea(
            child: Row(
              children: [
                OutlinedButton(
                    onPressed: () => setState(() => amount--),
                    child: const Icon(Icons.remove)),
                const SizedBox(width: 10),
                SizedBox(
                  width: 20,
                  child: Text(
                    amount.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                    onPressed: () => setState(() => amount++),
                    child: const Icon(Icons.add)),
                const Spacer(),
                ElevatedButton(
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
                  },
                  child: const Text(
                    "ADD TO CART",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
