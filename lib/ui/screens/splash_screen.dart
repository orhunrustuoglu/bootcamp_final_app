import '/data/constants/animations.dart';
import '/data/constants/custom_colors.dart';
import '/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: Lottie.asset(
                logoAnimation,
                height: 100,
              ),
            ),
          ],
        ));
  }
}
