import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../utils/app_styles.dart';

class LoginWithFacebook extends StatefulWidget {
  const LoginWithFacebook({super.key});

  @override
  State<LoginWithFacebook> createState() => _LoginWithFacebookState();
}

class _LoginWithFacebookState extends State<LoginWithFacebook> {
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      controller: facebookController,
      onPressed: () {},
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
    );
  }
}
