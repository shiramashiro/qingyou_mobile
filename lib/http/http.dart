import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/user.dart';
import '../utils/utils.dart';

class Http {
  BaseOptions? baseOptions;

  Http({this.baseOptions});


  void after(Future future) {
    future.then((value) {
      EasyLoading.dismiss();
      Utils.codeToast(value);
    }, onError: (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast('未知错误');
    }).timeout(
      const Duration(milliseconds: 12000),
      onTimeout: () {
        EasyLoading.dismiss();
        EasyLoading.showToast('请求超时');
      },
    );
  }

  /// @desc: 登陆方法
  /// @author: shiramashiro
  /// @date: 2022/3/4
  void login(String url, User user) {
    Dio dio = Dio(baseOptions);
    Future future = dio.post(url, data: user);

    EasyLoading.show(status: '登录中...');

    after(future);
  }

  void register(String url, User user) {
    Dio dio = Dio(baseOptions);
    Future future = dio.post(url, data: user);

    EasyLoading.show(status: '注册中...');

    after(future);
  }
}
