// import 'package:json_annotation/json_annotation.dart';


// class loginModel {
//   String? msg;
//   String? accessToken;
//   User? user;

//   loginModel({this.msg, this.accessToken, this.user});

//   loginModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     accessToken = json['access_token'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['msg'] = this.msg;
//     data['access_token'] = this.accessToken;
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     return data;
//   }
// }

// class User {
//   List<Null>? recipes;
//   List<Null>? followers;
//   List<Null>? following;
//   List<Null>? likePosts;
//   List<Null>? savePosts;
//   List<Null>? userPosts;
//   String? sId;
//   String? fullName;
//   String? email;
//   String? password;
//   String? gender;
//   int? age;
//   String? avt;
//   double? height;
//   int? weight;
//   int? iV;

//   User(
//       {this.recipes,
//       this.followers,
//       this.following,
//       this.likePosts,
//       this.savePosts,
//       this.userPosts,
//       this.sId,
//       this.fullName,
//       this.email,
//       this.password,
//       this.gender,
//       this.age,
//       this.avt,
//       this.height,
//       this.weight,
//       this.iV});

//   User.fromJson(Map<String, dynamic> json) {
//     if (json['recipes'] != null) {
//       recipes = <Null>[];
//       json['recipes'].forEach((v) {
//         recipes!.add(Null.fromJson(v));
//       });
//     }
//     if (json['followers'] != null) {
//       followers = <Null>[];
//       json['followers'].forEach((v) {
//         followers!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['following'] != null) {
//       following = <Null>[];
//       json['following'].forEach((v) {
//         following!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['likePosts'] != null) {
//       likePosts = <Null>[];
//       json['likePosts'].forEach((v) {
//         likePosts!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['savePosts'] != null) {
//       savePosts = <Null>[];
//       json['savePosts'].forEach((v) {
//         savePosts!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['userPosts'] != null) {
//       userPosts = <Null>[];
//       json['userPosts'].forEach((v) {
//         userPosts!.add(new Null.fromJson(v));
//       });
//     }
//     sId = json['_id'];
//     fullName = json['fullName'];
//     email = json['email'];
//     password = json['password'];
//     gender = json['gender'];
//     age = json['age'];
//     avt = json['avt'];
//     height = json['height'];
//     weight = json['weight'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.recipes != null) {
//       data['recipes'] = this.recipes!.map((v) => v.toJson()).toList();
//     }
//     if (this.followers != null) {
//       data['followers'] = this.followers!.map((v) => v.toJson()).toList();
//     }
//     if (this.following != null) {
//       data['following'] = this.following!.map((v) => v.toJson()).toList();
//     }
//     if (this.likePosts != null) {
//       data['likePosts'] = this.likePosts!.map((v) => v.toJson()).toList();
//     }
//     if (this.savePosts != null) {
//       data['savePosts'] = this.savePosts!.map((v) => v.toJson()).toList();
//     }
//     if (this.userPosts != null) {
//       data['userPosts'] = this.userPosts!.map((v) => v.toJson()).toList();
//     }
//     data['_id'] = this.sId;
//     data['fullName'] = this.fullName;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['gender'] = this.gender;
//     data['age'] = this.age;
//     data['avt'] = this.avt;
//     data['height'] = this.height;
//     data['weight'] = this.weight;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
