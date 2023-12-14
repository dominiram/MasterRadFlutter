import 'package:flutter/material.dart';
import 'package:master_rad_flutter/screens/profile_screen.dart';
import 'package:master_rad_flutter/screens/screens.dart';

class BottomNavBar extends StatelessWidget {
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.indigo.withAlpha(20),
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: const Icon(Icons.home_filled)),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchScreen.routeName);
                },
                icon: const Icon(Icons.search_sharp)),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
                icon: const Icon(Icons.person)),
            label: 'Profile')
      ],
    );
  }

  const BottomNavBar({super.key, required this.index});
}
