import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/apis/http.dart';
import 'package:qingyuo_mobile/models/user_model.dart';

class LoginApi extends Http {
  static const String _loginUrl = "http://localhost:8080/users/login";

  /// @desc: 登陆方法
  /// @author: shiramashiro
  /// @date: 2022/3/4
  void login(User user) {
    Future future = dio.post(_loginUrl, data: user);
    EasyLoading.show(status: '登录中...');
    thenSteps(future);
  }
}
