import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/Screens/add_screen.dart';
import 'package:cooking_social_network/Screens/home_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:cooking_social_network/Screens/profile_screen.dart';
import 'package:cooking_social_network/Screens/save_screen.dart';
import 'package:cooking_social_network/Screens/search_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SeachScreen(),
    const AddScren(),
    const SaveScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Styles.blueColor,
        unselectedItemColor: Styles.blueColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_add_circle_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_add_circle_filled),
              label: "Add"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_bookmark_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_bookmark_filled),
              label: "Save"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "Profile"),
        ],
      ),
    );
  }
}
