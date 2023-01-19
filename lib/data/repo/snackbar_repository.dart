import 'package:bootcamp_final_app/data/constants/custom_colors.dart';
import 'package:bootcamp_final_app/data/entitiy/cart_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/cubit/my_cart_page_cubit.dart';

class SnackbarRepository {
  static void showDeleteSnackbar(BuildContext context, CartMeal cartMeal) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Row(
          children: [
            Expanded(
                child: Text(
              "Are you sure you want to delete:\n${cartMeal.name}?",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: textColorDark),
            )),
            TextButton.icon(
                onPressed: (() {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  context.read<MyCartPageCubit>().deleteCartMeal(cartMeal);
                }),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text(
                  "DELETE",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ))
          ],
        )));
  }
}
