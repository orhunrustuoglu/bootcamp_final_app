import 'package:bootcamp_final_app/data/constants/custom_colors.dart';
import 'package:bootcamp_final_app/data/entitiy/cart_meal.dart';
import 'package:bootcamp_final_app/ui/cubit/my_cart_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartMealCard extends StatelessWidget {
  final CartMeal cartMeal;
  const CartMealCard({super.key, required this.cartMeal});

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cartMeal.name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColorDark),
                      ),
                      GestureDetector(
                        onTap: () => context
                            .read<MyCartPageCubit>()
                            .confirmDelete(context, cartMeal),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: primaryColor.withOpacity(0.2)),
                            child: const Icon(
                              Icons.delete,
                              color: primaryColor,
                            )),
                      )
                    ]),
                const SizedBox(height: 20),
                Text(
                  "${cartMeal.price}₺",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColorLight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
