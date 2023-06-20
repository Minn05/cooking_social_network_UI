// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_network/provider/internet_provider.dart';
import 'package:cooking_social_network/provider/sign_in_provider.dart';
import 'package:cooking_social_network/screens/bottom_bar.dart';
import 'package:cooking_social_network/utils/next_screen.dart';
import 'package:cooking_social_network/utils/snack_bar.dart';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:cooking_social_network/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../widgets/password_input.dart';
import '../widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundLogin(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          'Welcome to\n Minn',
                          style: Styles.textStyle,
                        ),
                        // Text(
                        //   'Minn',
                        //   style: Styles.textStyle,
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const TextInput(
                            icon: FluentSystemIcons.ic_fluent_mail_filled,
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                          ),
                          const PasswordInput(
                            hint: 'Password',
                            inputAction: TextInputAction.done,
                            icon: FluentSystemIcons.ic_fluent_lock_filled,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Forgot Password?',
                              style: Styles.headLineStyle1
                                  .copyWith(color: const Color(0xFF7CC6C6))),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Or',
                            style: Styles.headLineStyle2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //login with Google
                          RoundedLoadingButton(
                            controller: googleController,
                            onPressed: () {
                              handleGoogleSignIn();
                            },
                            successColor: Colors.redAccent,
                            width: MediaQuery.of(context).size.width * 0.80,
                            elevation: 0,
                            borderRadius: 25,
                            color: Colors.redAccent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.google,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  "Sign in with Google",
                                  style: Styles.headLineStyle1.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          //login with Facebook
                          RoundedLoadingButton(
                            controller: facebookController,
                            onPressed: () {
                              handleGoogleSignIn();
                            },
                            successColor: Styles.marinerColor,
                            width: MediaQuery.of(context).size.width * 0.80,
                            elevation: 0,
                            borderRadius: 25,
                            color: Styles.marinerColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.facebook,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  "Sign in with Facebook",
                                  style: Styles.headLineStyle1.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //handling google sign in
  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackBar(context, "Check your internet connection", Colors.red);
      googleController.reset();
      facebookController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackBar(context, sp.errorCode.toString(), Colors.red);
          googleController.reset();
        } else {
          //checking whether user exists or not exists

          sp.checkUserExists().then((value) async {
            if (value == true) {
              //user exists
            } else {
              //user doew not exists
              sp.saveDataForFireStore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAferSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  handleAferSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, const BottomBar());
    });
  }
}
