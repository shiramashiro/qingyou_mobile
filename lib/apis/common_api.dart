import 'package:qingyuo_mobile/apis/api_config.dart';
import 'package:qingyuo_mobile/models/user_model.dart';

/// 普通的接口。例如，请求和注册接口。
class CommonAPI extends APIConfig {
  Future login(User user) {
    return dio.post('$baseURL/users/login', data: user);
  }

  Future register(User user) {
    return dio.post('$baseURL/users/register', data: user);
  }
}
