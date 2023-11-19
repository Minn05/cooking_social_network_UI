class LoginResponse {
  String? msg;
  String? accessToken;

  LoginResponse({this.msg, this.accessToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['access_token'] = this.accessToken;
    return data;
  }
}
