import 'package:cooking_social_network/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';

import '../utils/app_styles.dart';

class TextandTextInput extends StatelessWidget {
  const TextandTextInput({
    super.key,
    required this.text,
    required this.texthin,
  });

  final String text;
  final String texthin;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.headLineStyle1.copyWith(color: Styles.textColor),
        ),
        TextInput(
          width: MediaQuery.of(context).size.width * 0.6,
          hint: texthin,
          inputType: TextInputType.text,
          inputAction: TextInputAction.send,
        ),
      ],
    );
  }
}
