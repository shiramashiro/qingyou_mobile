import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// 规定所有 API 所使用的共同代码。
///
/// 2000 系列为正确的结果。
/// 5000 系列为错误的结果。
///
/// 因为接口都需要使用 Dio 进行请求，所以，Http 作为它们的父类要创建 Dio。
/// 除此之外，Http 子类可以配置 Dio。
///
/// 请求完成之后，[httpThen] 方法主要进行一个状态码判定，对于的状态码给出对应的
/// 信息提示。
class Http {
  final Dio dio = Dio();

  final Map<int, String> _codes = {
    2000: '注册成功',
    5000: '用户已存在',
    5001: '未知错误',
    5002: '用户不存在',
    5003: '密码错误',
    5004: '请求超时',
    5005: '手机号已被注册'
  };

  Map<int, String> get codes => _codes;

  /// @desc: Http 请求完成之后对 state（状态码）作出相应的提示
  /// @author: shiramashiro
  /// @date: 2022/3/5
  void httpThen(dynamic json) {
    int fromJsonState = jsonDecode(json.toString())['state'];
    _codes.forEach((definedStateCode, definedStateValue) {
      if (fromJsonState == definedStateCode) {
        EasyLoading.showToast(definedStateValue);
        return;
      }
    });
  }
}
