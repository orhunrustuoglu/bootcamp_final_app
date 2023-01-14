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
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
