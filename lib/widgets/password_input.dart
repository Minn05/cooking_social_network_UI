import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputAction,
  }) : super(key: key);
  final IconData icon;
  final String hint;

  final TextInputAction inputAction;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400.withOpacity(0.5),
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          hintStyle: Styles.headLineStyle1,
        ),
        obscureText: true,
        style: Styles.headLineStyle1,
        textInputAction: inputAction,
      ),
    );
  }
}
