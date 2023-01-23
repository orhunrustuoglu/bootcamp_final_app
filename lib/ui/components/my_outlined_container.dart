import '/data/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class MyOutlinedContainer extends StatelessWidget {
  final Widget child;
  const MyOutlinedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor, width: 1)),
      child: child,
    );
  }
}
