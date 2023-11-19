import 'package:cooking_social_network/model/auth_model/login_resquest/login_request.dart';
import 'package:cooking_social_network/screens/bottombar/bottom_bar.dart';
import 'package:cooking_social_network/screens/login/controller/loginCtrl.dart';
import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../widgets/background_login.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

class LoginScreenState extends StatelessWidget {
  bool _hidden = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  var data = LoginRequest(email: "", password: "");

  @override
  Widget build(BuildContext context) {
    data = LoginRequest(email: _email.text, password: _password.text);
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
                        controller: _email,
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
                        controller: _password,
                        obscureText: _hidden,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email Address",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: _hidden
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              // setState(() {
                              //   _hidden = !_hidden;
                              // });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                // const SizedBox(height: 40),
                // FutureBuilder(
                //   future: Future.value(true),
                //   builder: (context, snapshot) {
                //     // Kiểm tra xem Future đã hoàn thành chưa
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       // Nếu hoàn thành, hiển thị Container và TextButton
                //       return
                GetX<LoginCtrl>(
                  init: LoginCtrl(),
                  builder: (controller) => Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: TextButton(
                        onPressed: () {
                          controller.login(data);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const BottomBar(),
                          //   ),
                          // );
                        },
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
                ),
                //     } else {
                //       // Nếu Future chưa hoàn thành, hiển thị một tiến trình tải
                //       return const CircularProgressIndicator();
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
