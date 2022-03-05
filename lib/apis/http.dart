import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// 规定所有 API 所使用的共同代码。
///
/// 请求后的状态码，2000 系列都是成功、正确的请求；
/// 4000 系列都是用户输入错误的请求、错误类型比较轻；
/// 5000 系列都是一些严重性的错误；
/// 6000 系列是在请求时出现的意外。
///
/// 所有的接口都要使用 Dio 进行请求，因此，Http 类中拥有一个 baseOptions
/// 以供所有的子类进行请求配置。
///
/// 请求完成之后，[afterHttpInfo] 方法主要进行一个状态码判定，对于的状态码给出对应的
/// 信息提示。
class Http {
  final BaseOptions? baseOptions;

  /// 使用 Http 时，可以为其传递 Dio 相关的参数
  Http({this.baseOptions});

  /// 这都是一系列状态码以及状态码对应的信息
  final Map<int, String> _codes = {
    2000: '注册成功',
    4000: '用户已存在',
    5000: '未知错误',
    5001: '用户不存在',
    5002: '密码错误',
    6000: '请求超时'
  };

  Map<int, String> get codes => _codes;

  /// @desc: 由于所有的请求都要用到 Dio，所以需要创建 Dio 对象
  /// @author: shiramashiro
  /// @date: 2022/3/5
  Dio createDio() {
    return Dio(baseOptions);
  }

  /// @desc: Http 请求完成之后对 state（状态码）作出相应的提示
  /// @author: shiramashiro
  /// @date: 2022/3/5
  void afterHttpInfo(dynamic json) {
    int fromJsonState = jsonDecode(json.toString())['state'];
    _codes.forEach((definedStateCode, definedStateValue) {
      if (fromJsonState == definedStateCode) {
        EasyLoading.showToast(definedStateValue);
        return;
      }
    });
  }

  /// @desc: 登陆之后对返回的数据进行状态码判断，并提示用户
  /// @author: shiramashiro
  /// @date: 2022/3/5
  void afterHttpProcess(Future future) {
    future.then((value) {
      EasyLoading.dismiss();
      afterHttpInfo(value);
    }, onError: (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast('${_codes[5000]}');
    }).timeout(
      const Duration(milliseconds: 12000),
      onTimeout: () {
        EasyLoading.dismiss();
        EasyLoading.showToast('${_codes[6000]}');
      },
    );
  }
}
