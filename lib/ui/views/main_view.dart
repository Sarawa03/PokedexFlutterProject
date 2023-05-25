import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/services/auth/bloc/auth_bloc.dart';
import 'package:flutterproject/services/auth/bloc/auth_event.dart';
import 'package:flutterproject/ui/navigation_screens/account_view.dart';
import 'package:flutterproject/ui/navigation_screens/favorites_view.dart';
import 'package:flutterproject/ui/navigation_screens/home_view.dart';
import 'package:flutterproject/ui/navigation_screens/search_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  final screens = [
    const HomeView(),
    const SearchView(),
    const FavoritesView(),
    const AccountView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          backgroundColor: tPrimaryColor,
          selectedItemColor: tBlack,
          unselectedItemColor: tDarkGrey,
          type: BottomNavigationBarType.shifting,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: tPrimaryColor),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: tPrimaryColor,
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                activeIcon: Icon(Icons.favorite),
                label: 'Favorites',
                backgroundColor: tPrimaryColor),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person_3_outlined),
                activeIcon: Icon(Icons.person_3),
                label: 'Account',
                backgroundColor: tPrimaryColor),
          ]),
    );
  }
}
