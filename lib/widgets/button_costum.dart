import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xffA0A5B9).withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 20)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            Image(image: AssetImage('assets/images/$icon'), height: 30),
            const SizedBox(width: 15),
            Text(
              '$text',
              style: Styles.headLineStyle1.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
