import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    this.height,
    this.width,
  }) : super(key: key);

  final IconData? icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade400.withOpacity(0.5),
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          border: InputBorder.none,
          hintText: hint,
          hintMaxLines: 10,
          hintStyle: Styles.headLineStyle1.copyWith(color: Styles.textColor),
        ),
        style: Styles.headLineStyle1.copyWith(color: Styles.textColor),
        keyboardType: inputType,
        textInputAction: inputAction,
      ),
    );
  }
}
