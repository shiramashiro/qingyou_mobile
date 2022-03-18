import 'package:qingyuo_mobile/apis/http.dart';
import 'package:qingyuo_mobile/models/user_model.dart';

class PrimaryApi extends Http {
  static const String _loginPath = "http://localhost:8080/users/login";
  static const String _registerPath = "http://localhost:8080/users/register";

  /// @desc: 登陆方法
  /// @author: shiramashiro
  /// @date: 2022/3/4
  Future login(User user) {
    return dio.post(_loginPath, data: user);
  }

  /// @desc: 注册方法
  /// @author: shiramashiro
  /// @date: 2022/3/5
  Future register(User user) {
    return dio.post(_registerPath, data: user);
  }
}
