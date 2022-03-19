import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class HttpResponse {
  final Map<int, String> _codes = {
    2000: '登陆成功',
    2001: '注册成功',
    5000: '手机号不正确',
    5001: '用户名不正确',
    5002: '电子邮箱不正确',
    5003: '密码不正确',
    5004: '手机号已存在',
    5005: '用户名已存在',
  };

  /// @desc: Http 请求完成之后对 state（状态码）作出相应的提示
  /// @author: shiramashiro
  /// @date: 2022/3/5
  void resState(dynamic json) {
    int fromJsonState = jsonDecode(json.toString())['state'];
    _codes.forEach((definedStateCode, definedStateValue) {
      if (fromJsonState == definedStateCode) {
        EasyLoading.showToast(definedStateValue);
        return;
      }
    });
  }

  void resByLoading(Future future) {
    future.then((value) {
      EasyLoading.dismiss();
      resState(value);
    }, onError: (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast('未知错误');
    }).timeout(
      const Duration(milliseconds: 20000),
      onTimeout: () {
        EasyLoading.dismiss();
        EasyLoading.showToast('连接超时');
      },
    );
  }
}
