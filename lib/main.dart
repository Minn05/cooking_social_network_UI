import 'package:cooking_social_network/provider/internet_provider.dart';
import 'package:cooking_social_network/provider/sign_in_provider.dart';
import 'package:cooking_social_network/screens/bottombar/bottom_bar.dart';
import 'package:cooking_social_network/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Social Network Cooking',
        theme: ThemeData(
          primaryColor: primary,
        ),
        home: LoginScreenState(),
      ),
    );
  }
}
