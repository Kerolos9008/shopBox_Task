import 'package:dio/dio.dart';
import 'package:shopbox_task/services/webService.dart';

class LoginRepo {
  WebService _webService = WebService();

  Future<Response> login(String email, String password) {
    return _webService.freeDio.post(
      "api/v3/authenticate/credentials",
      data: {
        "username": email,
        "password": password,
      },
    );
  }

  Future<void>saveToken(String accessToken){
    return _webService.setMobileToken(accessToken);
  }
}
