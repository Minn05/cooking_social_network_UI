import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInfoText extends StatelessWidget {
  TextEditingController? input;
  final String labelText;
  final String hintText;
  Icon? icon;

  ProfileInfoText({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.icon,
    this.input,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: input,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: icon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui lòng nhập tên của bạn';
        }
        return null;
      },
    );
  }
}
