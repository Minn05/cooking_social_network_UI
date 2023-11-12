import 'package:cooking_social_network/utils/app_layout.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:gap/gap.dart';
import '../../widgets/background_login.dart';
import '../../widgets/password_input.dart';
import '../../widgets/text_input.dart';

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
                    const TextInput(
                      icon: FluentSystemIcons.ic_fluent_mail_filled,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    Gap(AppLayout.getHeight(10)),
                    const PasswordInput(
                      hint: 'Password',
                      inputAction: TextInputAction.done,
                      icon: FluentSystemIcons.ic_fluent_lock_filled,
                    ),
                    Gap(AppLayout.getHeight(10)),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
