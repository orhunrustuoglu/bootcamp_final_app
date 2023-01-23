import 'package:bootcamp_final_app/data/constants/animations.dart';
import 'package:bootcamp_final_app/data/constants/custom_colors.dart';
import 'package:bootcamp_final_app/data/entitiy/cart_meal.dart';
import 'package:bootcamp_final_app/data/entitiy/cart_meals_response.dart';
import 'package:bootcamp_final_app/ui/components/cart_meal_card.dart';
import 'package:bootcamp_final_app/ui/components/my_elevated_button.dart';
import 'package:bootcamp_final_app/ui/components/order_in_delivery_card.dart';
import 'package:bootcamp_final_app/ui/cubit/my_cart_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  void initState() {
    super.initState();
    context.read<MyCartPageCubit>().getCartMeals();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCartPageCubit, CartMealsResponse>(
        builder: (context, mealsResponse) {
      List<CartMeal> cartMeals = mealsResponse.cartMeals;
      if (mealsResponse.success == 0) {
        return const Center(child: CircularProgressIndicator.adaptive());
      } else if (mealsResponse.cartMeals.isEmpty) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              orderNowAnimation,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Your cart is empty...",
                style: TextStyle(color: textColorLight, fontSize: 16),
              ),
            )
          ],
        ));
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Expanded(
                child: ListView.builder(
                    itemCount: cartMeals.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CartMealCard(
                          cartMeal: cartMeals[index],
                          onDelivery: context
                              .read<MyCartPageCubit>()
                              .getOrderConfirmed(),
                        ),
                      );
                    }))),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total: ",
                      style: TextStyle(color: textColorDark, fontSize: 16),
                    ),
                    Text(
                      "${context.read<MyCartPageCubit>().getTotalPrice()}₺",
                      style: const TextStyle(
                          color: textColorDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ]),
            ),
            (() {
              if (context.read<MyCartPageCubit>().getOrderConfirmed()) {
                return const OrderInDeliveryCard();
              } else {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: MyElevatedButton(
                      text: "CONFIRM ORDER",
                      onPressed: () {
                        //displayes the confirm snackbar
                        context.read<MyCartPageCubit>().confirmOrder(context,
                            () {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          Future.delayed(
                              Duration.zero,
                              //updates the confirmed status globally
                              () => context
                                  .read<MyCartPageCubit>()
                                  .confirmCurrentOrder()).then((_) =>
                              context.read<MyCartPageCubit>().getCartMeals());
                          print("Order Confirmed!");
                        });
                      }),
                );
              }
            }())
          ]),
        );
      }
    });
  }
}
