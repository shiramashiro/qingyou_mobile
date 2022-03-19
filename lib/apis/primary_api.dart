import 'package:qingyuo_mobile/apis/http.dart';
import 'package:qingyuo_mobile/models/user_model.dart';

class PrimaryApi extends Http {
  Future login(User user) {
    return dio.post('$baseURL/users/login', data: user);
  }

  Future register(User user) {
    return dio.post('$baseURL/users/register', data: user);
  }
}
