import 'package:bootcamp_final_app/data/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class MyElevatedContainer extends StatelessWidget {
  final Widget child;
  const MyElevatedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: primaryColor.withOpacity(0.2)),
      child: child,
    );
  }
}
