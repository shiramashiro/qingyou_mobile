import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/user.dart';

class Http {
  BaseOptions? baseOptions;

  static const Map<int, String> codes = {
    2000: '注册成功',
    4000: '用户已存在',
    5000: '未知错误',
    5001: '用户不存在',
    5002: '密码错误',
    6000: '请求超时'
  };

  Http({this.baseOptions});

  static void codeToast(dynamic json) {

    var code = jsonDecode(json.toString())['state'];
    codes.forEach((key, value) {
      if (code == key) {
        EasyLoading.showToast(value);
        return;
      }
    });
  }

  void after(Future future) {
    future.then((value) {
      EasyLoading.dismiss();
      codeToast(value);
    }, onError: (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast('${codes[5000]}');
    }).timeout(
      const Duration(milliseconds: 12000),
      onTimeout: () {
        EasyLoading.dismiss();
        EasyLoading.showToast('${codes[6000]}');
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
