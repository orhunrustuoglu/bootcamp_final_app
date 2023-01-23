import 'package:bootcamp_final_app/data/entitiy/cart_meal.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const MyElevatedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
