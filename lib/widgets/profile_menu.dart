import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.iconLeading,
    required this.text,
    required this.onTap,
    this.iconTrailing,
  }) : super(key: key);

  final IconData iconLeading;
  final IconData? iconTrailing;
  final String text;
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            iconLeading,
            color: Styles.textColor,
          ),
        ),
        title: Text(
          text,
          style: Styles.headLineStyle1.copyWith(color: Styles.textColor),
        ),
      ),
    );
  }
}
