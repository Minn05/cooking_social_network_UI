import 'package:cooking_social_network/screens/login/text_input.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class HeightWeight extends StatelessWidget {
  const HeightWeight({
    Key? key,
    this.height,
    this.width,
    required this.text,
    required this.texthin, required this.texttype, required this.inputaction,
  }) : super(key: key);

  final String text;
  final String texthin;
  final double? height;
  final double? width;
  final TextInputType texttype;
  final TextInputAction inputaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.headLineStyle1.copyWith(color: Styles.textColor),
        ),
        TextInput(
          height: height,
          width: width,
          hint: texthin,
          inputType: TextInputType.text,
          inputAction: TextInputAction.send,
        ),
      ],
    );
  }
}
