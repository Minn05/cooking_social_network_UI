import 'dart:async';
import 'package:cooking_social_network/provider/sign_in_provider.dart';
import 'package:cooking_social_network/screens/bottombar/bottom_bar.dart';
import 'package:cooking_social_network/screens/home/home_screen.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/utils/next_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final sp = context.read<SignInProvider>();

    super.initState();

    //create timer 2s
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context, const HomeScreen())
          : nextScreen(context, const BottomBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.blueColor,
      body: const SafeArea(
        child: Center(
          child: CircleAvatar(
            radius: 160,
            backgroundImage: AssetImage('assets/images/logo_app.png'),
          ),
        ),
      ),
    );
  }
}
