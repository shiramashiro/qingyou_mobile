import 'package:qingyuo_mobile/apis/api_config.dart';
import 'package:qingyuo_mobile/models/user_model.dart';

class CommonAPI extends APIConfig {
  Future login(User user) {
    return dio.post('$baseURL/users/login', data: user);
  }

  Future register(User user) {
    return dio.post('$baseURL/users/register', data: user);
  }
}
