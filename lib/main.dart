import 'package:flutter/material.dart';
import 'package:cooking_social_network/Screens/bottom_bar.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:cooking_social_network/login/login_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Network Cooking',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: const LoginCreen(),
    );
  }
}
