import '/data/constants/animations.dart';
import '/data/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class OrderInDeliveryCard extends StatelessWidget {
  const OrderInDeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: primaryColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            width: 80,
            height: 75,
            child: Lottie.asset(
              onDeliveryAnimation,
              height: 100,
            ),
          ),
          const Expanded(
            //in case of an overlfow
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Your order is being delivered...",
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
