import 'package:cooking_social_network/model/auth_model/login_respone/login_respone.dart';
import 'package:cooking_social_network/model/auth_model/login_resquest/login_request.dart';
import 'package:cooking_social_network/services/api_service.dart';

class ApiController implements ApiService {
  ApiService? _client;
  @override
  Future<LoginResponse> postLogin({required LoginRequest request}) {
    // TODO: implement postLogin
    return _client!.postLogin(request: request);
  }
}
