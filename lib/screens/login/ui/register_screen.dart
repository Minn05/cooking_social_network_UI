import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:gap/gap.dart';
import '../../../widgets/background_login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundLogin(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                SizedBox(
                  child: Center(
                    child: Column(
                      children: [
                        Gap(AppLayout.getHeight(50)),
                        Text(
                          'Welcome to\n Minn',
                          style: Styles.textStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(150)),
                //Email
                const TextField(
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Your Email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(10)),
                //Password
                const TextField(
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.red,
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(10)),
                //Confirm Password
                const TextField(
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Confirm Password",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.red,
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(10)),
                Text(
                  'Forgot Password?',
                  style: Styles.headLineStyle1.copyWith(
                    color: const Color(0xFF7CC6C6),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: Styles.headLineStyle1.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
