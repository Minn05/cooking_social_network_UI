import 'dart:convert';

RegisterResponseModel registerResponseFromJson(String str) =>
    RegisterResponseModel.fromJson(jsonDecode(str));

class RegisterResponseModel {
  String? msg;
  String? accessToken;
  User? user;

  RegisterResponseModel({this.msg, this.accessToken, this.user});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    accessToken = json['access_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['access_token'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? fullName;
  String? email;
  String? password;
  String? gender;
  String? age;
  String? avt;
  String? height;
  String? weight;

  User(
      {this.fullName,
      this.email,
      this.password,
      this.gender,
      this.age,
      this.avt,
      this.height,
      this.weight});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    age = json['age'];
    avt = json['avt'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['avt'] = this.avt;
    data['height'] = this.height;
    data['weight'] = this.weight;
    return data;
  }
}
