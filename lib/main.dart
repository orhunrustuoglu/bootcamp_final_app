import 'package:bootcamp_final_app/data/constants/custom_colors.dart';
import 'package:bootcamp_final_app/ui/cubit/meal_details_page_cubit.dart';
import 'package:bootcamp_final_app/ui/cubit/my_cart_page_cubit.dart';
import 'package:bootcamp_final_app/ui/screens/splash_screen.dart';
import 'package:flutter/services.dart';

import '/ui/cubit/home_page_cubit.dart';
import 'ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //the design is inspired from:
    //https://www.behance.net/gallery/158187713/Food-delivery-app-UX-case-study?tracking_source=search_projects%7Cfood+app

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(create: (context) => MyCartPageCubit()),
        BlocProvider(create: (context) => MealDetailsPageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Rubik',
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: primaryColor),
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              elevation: 0,
              backgroundColor: backgroundColor),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: backgroundColor,
              selectedItemColor: primaryColor,
              unselectedItemColor: textColorLight),
          primaryColor: primaryColor,
          scaffoldBackgroundColor: backgroundColor,
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: primaryColor,
                ),
                foregroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
