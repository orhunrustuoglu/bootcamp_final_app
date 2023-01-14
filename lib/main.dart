import 'package:bootcamp_final_app/ui/cubit/meal_details_page_cubit.dart';
import 'package:bootcamp_final_app/ui/cubit/my_cart_page_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(create: (context) => MyCartPageCubit()),
        BlocProvider(create: (context) => MealDetailsPageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.redAccent),
            primaryColor: Colors.redAccent,
            scaffoldBackgroundColor: const Color(0xfff7f7f7),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.redAccent,
                  ),
                  foregroundColor: Colors.redAccent,
                  shape: const StadiumBorder()),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: const StadiumBorder()),
            ),
            appBarTheme: const AppBarTheme(backgroundColor: Colors.redAccent)),
        home: const MainScreen(),
      ),
    );
  }
}
