import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScrenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  static getHeight(double pixels) {
    double x = getScrenHeight() / pixels;
    return getScrenHeight() / x;
  }

  static getWidth(double pixels) {
    double x = getScrenHeight() / pixels;
    return getScreenWidth() / x;
  }
}
