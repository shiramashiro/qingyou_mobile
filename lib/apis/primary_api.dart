import 'package:qingyuo_mobile/apis/http.dart';
import 'package:qingyuo_mobile/models/user_model.dart';

class PrimaryApi extends Http {
  static const String _loginPath = "http://localhost:8080/users/login";
  static const String _registerPath = "http://localhost:8080/users/register";

  Future login(User user) {
    return dio.post(_loginPath, data: user);
  }

  Future register(User user) {
    return dio.post(_registerPath, data: user);
  }
}
