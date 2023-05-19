import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:cooking_social_network/utils/app_styles.dart';
import 'package:cooking_social_network/widgets/widgets.dart';
import '../widgets/widgets.dart';

class LoginCreen extends StatelessWidget {
  const LoginCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundLogin(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: Center(
                    child: Text(
                      'Welcome to Minn',
                      style: Styles.textStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                            border: InputBorder.none,
                            hintText: "Email",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(
                                FluentSystemIcons.ic_fluent_mail_filled,
                                color: Colors.white,
                              ),
                            ),
                            hintStyle: Styles.headLineStyle,
                          ),
                          style: Styles.headLineStyle,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      //const Gap(10),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                            border: InputBorder.none,
                            hintText: "Email",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(
                                FluentSystemIcons.ic_fluent_mail_filled,
                                color: Colors.white,
                              ),
                            ),
                            hintStyle: Styles.headLineStyle,
                          ),
                          style: Styles.headLineStyle,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
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
}
