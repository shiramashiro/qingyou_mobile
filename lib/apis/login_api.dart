import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/apis/http.dart';

import '../models/user_model.dart';

class LoginApi extends Http {
  /// @desc: 登陆方法
  /// @author: shiramashiro
  /// @date: 2022/3/4
  void login(String url, User user) {
    Future future = createDio().post(url, data: user);
    EasyLoading.show(status: '登录中...');
    afterHttpProcess(future);
  }
}
