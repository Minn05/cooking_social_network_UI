import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../model/login_response_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null ? true : false;
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
  }

  static Future<void> logout(BuildContext context) async {
    await setLoginDetails(null as LoginResponseModel);
    Navigator.of(context).pushReplacementNamed('/login');
  }
}
