import 'package:bootcamp_final_app/ui/screens/tabs/home_screen_tabs/my_cart_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'tabs/home_screen_tabs/meals_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_screen_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screens = const [
    MealsTab(),
    MyCartTab(),
  ];
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screenIndex == 0 ? "Menu" : "My Cart")),
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: screenIndex,
          onTap: (value) => setState(() => screenIndex = value),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 50,
                  child: Icon(
                    FontAwesomeIcons.cartShopping,
                    size: 24,
                  ),
                ),
                label: "My Cart"),
          ]),
    );
  }
}
