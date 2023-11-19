import 'package:cooking_social_network/model/auth_model/login_respone/login_respone.dart';
import 'package:cooking_social_network/model/auth_model/login_resquest/login_request.dart';
import 'package:cooking_social_network/services/api_controller.dart';
import 'package:get/get.dart';

class LoginCtrl extends GetxController {
  RxString token = "".obs;
  var data = ApiController();

  @override
  void onInit() {
    super.onInit();
  }

  login(LoginRequest request) async {
    LoginResponse response = await data.postLogin(request: request);
    token.value = response.accessToken!;
    print(token.value);
  }
}
