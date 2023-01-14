import '/ui/screens/pages/home_page.dart';
import '/ui/screens/pages/my_cart_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var screens = const [
    HomePage(),
    MyCartPage(),
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
