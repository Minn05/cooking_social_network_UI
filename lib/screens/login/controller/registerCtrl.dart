// ignore: file_names
import 'dart:convert';

import 'package:cooking_social_network/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'content-type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.barseUrl + ApiEndPoints.authEndPoints.registerEmail);

      Map body = {
        'email': emailCtrl.text.trim(),
        'passwordCtrl': passwordCtrl.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);

          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          emailCtrl.clear();
          passwordCtrl.clear();
          //goto home
        } else {
          throw jsonDecode(response.body)["message"] ??
              "Unknown error occured: ";
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown error occured: ";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
