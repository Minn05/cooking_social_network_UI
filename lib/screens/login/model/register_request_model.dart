class RegisterRequestModel {
  String? fullName;
  String? email;
  String? password;
  String? gender;
  int? age;
  String? avt;
  double? height;
  int? weight;

  RegisterRequestModel(
      {this.fullName,
      this.email,
      this.password,
      this.gender,
      this.age,
      this.avt,
      this.height,
      this.weight});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
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
