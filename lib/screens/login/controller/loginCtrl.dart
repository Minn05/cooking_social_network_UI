// import 'dart:async';
// import 'dart:convert';

// import 'package:cooking_social_network/utils/api_endpoints.dart';
// import 'package:http/http.dart' as http;

// import '../model/login_model.dart';

// Future<LoginModel> loginWithEmail(String email, String password) async {
//   final response = await http.post(
//     // Uri.parse(ApiEndPoints.barseUrl + ApiEndPoints.authEndPoints.loginEmail
//     Uri.http('http://localhost/8000/api/auth/login'),

//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=utf-8'
//     },
//     body: jsonEncode(<String, String>{
//       'email': email,
//       'password': password,
//     }),
//   );
//   if (response.statusCode == 201) {
//     return LoginModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Login failed');
//   }
// }
