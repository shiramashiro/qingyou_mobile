import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/user_model.dart';
import 'low_reuse.dart';
import 'http.dart';

class RegisterApi extends Http {

  static const String _registerUrl = "http://localhost:8080/users/reg";

  /// @desc: 注册方法
  /// @author: shiramashiro
  /// @date: 2022/3/5
  void register(User user) {
    Future future = dio.post(_registerUrl, data: user);
    EasyLoading.show(status: '注册中...');
    LowReuse().thenSteps(future);
  }
}
