import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../utils/app_styles.dart';

class LoginWithGoole extends StatefulWidget {
  const LoginWithGoole({
    super.key,
  });

  @override
  State<LoginWithGoole> createState() => _LoginWithGooleState();
}

class _LoginWithGooleState extends State<LoginWithGoole> {
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      controller: googleController,
      onPressed: () {},
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
    );
  }
}
