import '/data/constants/animations.dart';
import '/data/constants/custom_colors.dart';
import '/data/entitiy/cart_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../ui/cubit/my_cart_page_cubit.dart';

class SnackbarRepository {
  // static void showActiveOrderExistsSnackbar(BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       behavior: SnackBarBehavior.floating,
  //       backgroundColor: backgroundColor,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       content: Row(
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.all(5),
  //             width: 80,
  //             height: 75,
  //             child: Lottie.asset(
  //               onDeliveryAnimation,
  //               height: 100,
  //             ),
  //           ),
  //           const Expanded(
  //               child: Text(
  //             "You already have an active order!\nYou cannot order before delivery.",
  //             style:
  //                 TextStyle(fontWeight: FontWeight.bold, color: textColorDark),
  //           )),
  //         ],
  //       )));
  // }

  static void showConfirmOrderSnackbar(
      BuildContext context, Function onPressed) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Row(
          children: [
            const Expanded(
                child: Text(
              "Siparişi onaylamak istediğinize emin misiniz?",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: textColorDark),
            )),
            TextButton.icon(
                onPressed: () => onPressed(),
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: primaryColor,
                ),
                label: const Text(
                  "SİPARİŞ\nVER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ))
          ],
        )));
  }

  static void showDeleteSnackbar(BuildContext context, CartMeal cartMeal) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Row(
          children: [
            Expanded(
                child: Text(
              "${cartMeal.name} ögesini silmek istediğinize emin misiniz?",
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
                  "SİL",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ))
          ],
        )));
  }
}
