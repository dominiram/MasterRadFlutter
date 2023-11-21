import 'package:flutter/material.dart';

class BottomNavBar extends BottomNavigationBar {
  BottomNavBar({super.key, required super.items});

  BottomNavigationBar createBottomNavBar(
      int currentIndex, List<BottomNavBarItem> items) {
    return BottomNavigationBar(currentIndex: currentIndex, items: items);
  }
}

class BottomNavBarItem extends BottomNavigationBarItem {
  BottomNavBarItem({required super.icon});

  BottomNavigationBarItem createBottomNavBar(
      IconData icon, String label, Function() onClick) {
    return BottomNavigationBarItem(
        icon: IconButton(
          onPressed: onClick,
          icon: Icon(icon),
        ),
        label: label);
  }
}
