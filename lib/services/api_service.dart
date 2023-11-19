import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../model/auth_model/login_resquest/login_request.dart';
import '../model/auth_model/login_respone/login_respone.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://localhost:5000')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/api/auth/login')
  Future<LoginResponse> postLogin({@Body() required LoginRequest request});
}
