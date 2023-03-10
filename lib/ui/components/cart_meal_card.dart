import '/data/constants/custom_colors.dart';
import '/data/entitiy/cart_meal.dart';
import '/ui/components/my_elevated_container.dart';
import '/ui/components/my_outlined_container.dart';
import '/ui/cubit/my_cart_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartMealCard extends StatelessWidget {
  final CartMeal cartMeal;
  final bool onDelivery;
  const CartMealCard(
      {super.key, required this.cartMeal, required this.onDelivery});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.network(
            "http://kasimadalan.pe.hu/yemekler/resimler/${cartMeal.imgName}",
            fit: BoxFit.contain,
            width: 150,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartMeal.name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColorDark),
                ),
                Text(
                  "${cartMeal.price * cartMeal.amount}₺",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColorLight),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              onDelivery
                  ? const SizedBox(
                      height: 45,
                    )
                  : GestureDetector(
                      onTap: () => context
                          .read<MyCartPageCubit>()
                          .confirmDelete(context, cartMeal),
                      child: const MyOutlinedContainer(
                          child: Icon(
                        Icons.delete,
                        color: primaryColor,
                      )),
                    ),
              MyElevatedContainer(
                child: Text(
                  "x${cartMeal.amount}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
