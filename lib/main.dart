// import 'package:cooking_social_network/login/login_Screen.dart';
import 'package:cooking_social_network/provider/internet_provider.dart';
import 'package:cooking_social_network/provider/sign_in_provider.dart';
import 'package:cooking_social_network/screens/add_recipe/add_screen.dart';
import 'package:cooking_social_network/screens/bottombar/bottom_bar.dart';
import 'package:cooking_social_network/screens/login/register_screen.dart';
import 'package:cooking_social_network/screens/login/stepper_register.dart';
import 'package:cooking_social_network/screens/profile/profile_screen.dart';
import 'package:cooking_social_network/screens/profile/profile_update_screen.dart';
// import 'package:cooking_social_network/screens/home_screen.dart';
// import 'package:cooking_social_network/screens/splash_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:provider/provider.dart';

void main() async {
  //initication the application
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
        home: const StepperScreen(),
      ),
    );
  }
}
