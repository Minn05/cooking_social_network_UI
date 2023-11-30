import 'package:cooking_social_network/screens/login/controller/loginCtrl.dart';
import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../widgets/background_login.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

class LoginScreenState extends StatefulWidget {
  @override
  State<LoginScreenState> createState() => _LoginScreenStateState();
}

class _LoginScreenStateState extends State<LoginScreenState> {
  // bool _hidden = true;
  LoginCtrl loginCtrl = Get.put(LoginCtrl());

  @override
  Widget build(BuildContext context) {
    // data = LoginRequest(email: _email.text, password: _password.text);
    return Stack(
      children: [
        const BackgroundLogin(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //Email Adresse
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: loginCtrl.emailCtrl,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email Address",
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    Gap(AppLayout.getHeight(10)),

                    //Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: loginCtrl.passwordCtrl,
                        // obscureText: _hidden,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email Address",
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Forgot Password?',
                      style: Styles.headLineStyle1.copyWith(
                        color: const Color(0xFF7CC6C6),
                      ),
                    ),
                  ],
                ),
                Gap(AppLayout.getHeight(40)),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: ElevatedButton(
                      onPressed: () => loginCtrl.loginWithEmail(),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
