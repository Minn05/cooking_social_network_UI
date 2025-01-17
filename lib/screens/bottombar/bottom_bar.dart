import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../add_recipe/ui/add_screen.dart';
import '../home/home_screen.dart';
import '../profile/ui/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final items = [
    Icon(
      Icons.home,
      size: 30,
      color: Styles.iconColor,
    ),
    Icon(
      Icons.add_circle_outline,
      size: 30,
      color: Styles.iconColor,
    ),
    Icon(
      Icons.circle_outlined,
      size: 30,
      color: Styles.iconColor,
    ),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Styles.bgColor,
        animationDuration: const Duration(milliseconds: 300),
        color: const Color(0xFFFAD1D6),
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      body: Container(
        color: Styles.bgColor,
        width: double.infinity,
        height: double.infinity,
        child: getSelectdWidget(index: index),
      ),
    );
  }

  Widget getSelectdWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        {
          widget = const HomeScreen();
          break;
        }
      case 1:
        {
          widget = const AddScren();
          break;
        }
      case 2:
        {
          widget = const ProfileScreen();
          break;
        }

      default:
        widget = const HomeScreen();
        break;
    }
    return widget;
  }
}
