import 'package:bootcamp_final_app/data/constants/custom_colors.dart';
import 'package:bootcamp_final_app/ui/components/my_elevated_container.dart';
import 'package:bootcamp_final_app/ui/cubit/home_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  var searchController = TextEditingController();
  var screens = const [
    HomePage(),
    MyCartPage(),
  ];
  int screenIndex = 0;
  bool isSearching = false;
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text(screenIndex == 0 ? "Menu" : "My Cart")
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(right: 10),
                child: TextField(
                  cursorColor: primaryColor,
                  decoration: const InputDecoration(border: InputBorder.none),
                  controller: searchController,
                  onChanged: (query) =>
                      context.read<HomePageCubit>().search(query),
                ),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () {
                  if (isSearching) {
                    searchController.clear();
                    context.read<HomePageCubit>().getMeals();
                  }
                  ;
                  setState(() => isSearching = !isSearching);
                },
                child: MyElevatedContainer(
                    child: Icon(!isSearching ? Icons.search : Icons.close))),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: screens[screenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: screenIndex,
          onTap: (value) => setState(() => screenIndex = value),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 42,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SizedBox(
                  child: Icon(
                    FontAwesomeIcons.cartShopping,
                    size: 28,
                  ),
                ),
                label: "My Cart"),
          ]),
    );
  }
}
