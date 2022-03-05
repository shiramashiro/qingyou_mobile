import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/apis/http.dart';

import '../models/user_model.dart';
import 'low_reuse.dart';

class RegisterApi extends Http {
  /// @desc: 注册方法
  /// @author: shiramashiro
  /// @date: 2022/3/5
  void register(String url, User user) {
    Future future = dio.post(url, data: user);
    EasyLoading.show(status: '注册中...');
    LowReuse().thenSteps(future);
  }
}
