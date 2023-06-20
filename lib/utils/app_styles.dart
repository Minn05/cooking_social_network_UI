import 'package:flutter/material.dart';

Color primary = const Color(0xFF687daf);

class Styles {
  static Color primaryColor = primary;
  static Color bgColor = const Color(0xFFDFE3EE);
  static Color textColor = const Color(0xFF363753);
  static Color blueColor = const Color(0xFF5CD2C6);
  static Color marinerColor = const Color(0xFF3a559f);

  static TextStyle textStyle = const TextStyle(
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headLineStyle1 = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    letterSpacing: -1.2,
  );
  static TextStyle headLineStyle2 = TextStyle(
    fontSize: 16,
    color: Colors.grey.shade600,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headLineStyle3 = TextStyle(
    fontSize: 25,
    color: blueColor,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.2,
  );
}
