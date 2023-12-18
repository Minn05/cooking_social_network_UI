import 'dart:convert';

import 'package:cooking_social_network/config.dart';
import 'package:cooking_social_network/screens/add_recipe/model/create_recipe_request_model.dart';
import 'package:cooking_social_network/screens/add_recipe/model/create_recipe_response_model.dart';
import 'package:cooking_social_network/screens/auth/model/login_request_model.dart';
import 'package:cooking_social_network/screens/auth/model/login_response_model.dart';
import 'package:cooking_social_network/screens/auth/model/register_response_model.dart';
import 'package:cooking_social_network/services/shared_service.dart';
import 'package:http/http.dart' as http;

import '../screens/auth/model/register_request_model.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.loginApi);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(
          loginResponseModelFromJson(response.body));

      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.registerApi);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseFromJson(response.body);
  }

  static Future<String> getUser() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.accessToken}'
    };

    var url = Uri.http(Config.apiUrl, Config.getUserApi);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  static Future<String> getAllRecipe() async {
    Map<String, String> recipeHeaders = {
      'Content-Type': 'application/json',
      //'Authorization': 'Basic ${loginDetails!.accessToken}'
    };

    var url = Uri.http(Config.apiUrl, Config.getAllRecipe);
    var response = await client.get(
      url,
      headers: recipeHeaders,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  static Future<bool> createRecipe(CreateRecipeRequestModel model) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.accessToken}'
    };
    var url = Uri.http(Config.apiUrl, Config.createRecipe);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(
          loginResponseModelFromJson(response.body));

      return true;
    } else {
      return false;
    }
  }
}
