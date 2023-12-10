import 'package:cooking_social_network/screens/bottombar/bottom_bar.dart';
import 'package:cooking_social_network/screens/login/services/shared_service.dart';
import 'package:cooking_social_network/screens/login/ui/login_Screen.dart';
import 'package:cooking_social_network/screens/login/ui/register_screen.dart';
import 'package:cooking_social_network/screens/login/ui/stepper_register.dart';
import 'package:flutter/material.dart';

Widget _defaultHome = const LoginScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = const BottomBar();
  }
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
        brightness: Brightness.light,
        primaryColor: Colors.redAccent,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan.shade600),
      ),
      routes: {
        '/': (context) => _defaultHome,
        '/register': (context) => const RegisterScreen(),
        '/bottombar': (context) => const BottomBar(),
        '/stepper': (context) => const StepperScreen(),
      },
    );
  }
}
