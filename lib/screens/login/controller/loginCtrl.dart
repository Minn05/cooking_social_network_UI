// ignore: file_names
import 'dart:convert';

import 'package:cooking_social_network/screens/bottombar/bottom_bar.dart';
import 'package:cooking_social_network/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginCtrl extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      // Xác thực dữ liệu đầu vào
      if (emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
        throw "Vui lòng nhập đầy đủ thông tin đăng nhập.";
      }
      var url = Uri.https(
          ApiEndPoints.barseUrl + ApiEndPoints.authEndPoints.loginEmail);
      Map<String, String> body = {
        'email': emailCtrl.text.trim(),
        'password': passwordCtrl.text
      };

      dynamic response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      print("response.body: " + response.body);
      print(jsonEncode(body));
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        // final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];

          Get.find<SharedPreferences>().setString('token', token);
          // final SharedPreferences? prefs = await _prefs;
          // await prefs?.setString('token', token);
          emailCtrl.clear();
          passwordCtrl.clear();

          //goto home
          Get.to(BottomBar());
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown error occured: ";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
      // print(exception);
    }
  }
}
