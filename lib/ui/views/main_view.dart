import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/services/api/api_repository.dart';
import 'package:flutterproject/services/api/bloc/api_bloc.dart';
import 'package:flutterproject/ui/screens/account_view.dart';
import 'package:flutterproject/ui/screens/favorites_view.dart';
import 'package:flutterproject/ui/screens/home_view.dart';
import 'package:flutterproject/ui/screens/search_view.dart';

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
    return BlocProvider<ApiBloc>(
      create: (context) => ApiBloc(Repository()),
      child: Scaffold(
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
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: tPrimaryColor),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                activeIcon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: tPrimaryColor,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  activeIcon: Icon(Icons.favorite),
                  label: 'Favorites',
                  backgroundColor: tPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_3_outlined),
                  activeIcon: Icon(Icons.person_3),
                  label: 'Account',
                  backgroundColor: tPrimaryColor),
            ]),
      ),
    );
  }
}
