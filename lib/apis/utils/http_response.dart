import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';

typedef OnFutureBefore = void Function();
typedef OnFutureSuccess = void Function(dynamic e);

/// 发起请求之后，需要对请求过来的 Future 进行操作。
class HttpResponse {
  final Map<int, String> _codes = {
    2000: '登陆成功',
    2001: '注册成功',
    2004: '上传成功',
    5000: '手机号不正确',
    5001: '用户名不正确',
    5002: '电子邮箱不正确',
    5003: '密码不正确',
    5004: '手机号已存在',
    5005: '用户名已存在',
  };

  /// 获取响应的 JSON 数据。
  dynamic getData(dynamic json) {
    return jsonDecode(json.toString());
  }

  /// 通过 _codes 匹配对应的响应数据中 state 字段。匹配成功，就返回相应的消息提示。
  String getMsg(dynamic json) {
    String result = "";
    int code = getData(json)['state'];
    _codes.forEach((key, value) {
      if (code == key) {
        result = value;
        return;
      }
    });
    return result;
  }

  /// 请求分为请求之前、请求之后以及请求成功。
  ///
  /// 1. 请求之前需要做什么。onFutureBefore
  /// 2. 请求之后需要做什么。doFuture
  /// 3. 请求成功需要做什么。onFutureSuccess
  void handleFutureByLoading({
    required Future doFuture,
    OnFutureBefore? onFutureBefore,
    OnFutureSuccess? onFutureSuccess,
    int milliseconds = 20000,
  }) {
    onFutureBefore != null ? onFutureBefore() : "";
    doFuture.then((value) {
      EasyLoading.dismiss();
      EasyLoading.showToast(getMsg(value));
      onFutureSuccess != null ? onFutureSuccess(getData(value)) : "";
    }, onError: (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast('未知错误');
    }).timeout(
      Duration(milliseconds: milliseconds),
      onTimeout: () {
        EasyLoading.dismiss();
        EasyLoading.showToast('连接超时');
      },
    );
  }
}
