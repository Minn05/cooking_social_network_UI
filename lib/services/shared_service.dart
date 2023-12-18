import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../screens/auth/model/login_response_model.dart';

class SharedService {
  static Future<bool?> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    var result = prefs.getBool("isLoggedIn");
    return result;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    final prefs = await SharedPreferences.getInstance();

    final loginDetailsString = prefs.getString("login_details");

    return loginDetailsString != null
        ? LoginResponseModel.fromJson(jsonDecode(loginDetailsString))
        : null;
  }

  static Future<void> setLoginDetails(LoginResponseModel responseModel) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        "login_details",
        responseModel != null
            ? jsonEncode(
                responseModel.toJson(),
              )
            : '{}');
    prefs.setBool("isLoggedIn", true);
  }

  static Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", false);

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  static Future<String?> createRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("isLoggedIn");
  }
}
