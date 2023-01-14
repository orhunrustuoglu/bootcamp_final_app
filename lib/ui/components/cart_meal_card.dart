import 'package:bootcamp_final_app/data/entitiy/cart_meal.dart';
import 'package:bootcamp_final_app/ui/cubit/my_cart_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartMealCard extends StatelessWidget {
  final CartMeal cartMeal;
  const CartMealCard({super.key, required this.cartMeal});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Image.network(
            "http://kasimadalan.pe.hu/yemekler/resimler/${cartMeal.imgName}"),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(cartMeal.name),
            Text(
              " x${cartMeal.amount.toString()}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () =>
                context.read<MyCartPageCubit>().deleteCartMeal(cartMeal)),
      ),
    );
  }
}
