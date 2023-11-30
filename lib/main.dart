import 'package:cooking_social_network/provider/internet_provider.dart';
import 'package:cooking_social_network/provider/sign_in_provider.dart';
import 'package:cooking_social_network/screens/login/ui/login_Screen.dart';
import 'package:cooking_social_network/screens/login/ui/register_screen.dart';
import 'package:cooking_social_network/screens/login/ui/stepper_register.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreenState(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => SignInProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => InternetProvider(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Social Network Cooking',
//         theme: ThemeData(
//           primaryColor: primary,
//         ),
//         home: LoginScreenState(),
//       ),
//     );
//   }
// }
