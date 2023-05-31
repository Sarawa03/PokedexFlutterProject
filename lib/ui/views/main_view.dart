import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/services/api/bloc/api_bloc.dart';
import 'package:flutterproject/services/api/bloc/api_event.dart';
import 'package:flutterproject/services/api/bloc/api_state.dart';
import 'package:flutterproject/ui/screens/account_view.dart';
import 'package:flutterproject/ui/screens/favorites_view.dart';
import 'package:flutterproject/ui/screens/home_view.dart';
import 'package:flutterproject/ui/screens/search_view.dart';
import 'dart:developer' as devtools show log;

import 'package:flutterproject/ui/views/details_view.dart';

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
    return BlocConsumer<ApiBloc, ApiState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ApiStateDetails) {
          return const DetailsView();
        }

        return Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                devtools.log(value.toString());
                setState(() {
                  selectedIndex = value;
                });
                if (value == 0) {
                  context
                      .read<ApiBloc>()
                      .add(const ApiEventGetRandomPokemons());
                }
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
        );
      },
    );
  }
}
