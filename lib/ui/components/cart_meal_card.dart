import 'package:bootcamp_final_app/data/entitiy/cart_meal.dart';
import 'package:flutter/material.dart';

class CartMealCard extends StatelessWidget {
  final CartMeal cartMeal;
  const CartMealCard({super.key, required this.cartMeal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Image.network(
              "http://kasimadalan.pe.hu/yemekler/resimler/${cartMeal.imgName}"),
          title: Text(cartMeal.name)),
    );
  }
}
