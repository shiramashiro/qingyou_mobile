import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegExpValues {
  static const String phone =
      r"^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$";

  static const String email =
      r"^[a-z]([a-z0-9]*[-_\.]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$";

  static const String uname = r"^[a-zA-Z0-9_-]{4,20}$";

  static const String uname2Phone =
      r"^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])";

  static const String password = r"^[0-9A-za-z\-\_\.]{6,16}$";
}

class DetectValues {
  static const String pwd = "字母、数字、_-. 长度在6~16位";
  static const String uname = "字母、数字、_- 长度在4~20位";
  static const String email = "xxxx@xx.xx";
  static const String phone = "11位数字";
}

class Utils {
  static void route(dynamic context, dynamic widget) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) => widget), (route) => false);
  }

  static bool match(String value, String regexp) {
    return RegExp(regexp).hasMatch(value);
  }

  static void codeToast(dynamic code) {
    var state = jsonDecode(code.toString())['state'];

    if (state == 5000) {
      EasyLoading.showToast('未知错误');
    } else if (state == 5001) {
      EasyLoading.showToast('用户不存在');
    } else if (state == 5002) {
      EasyLoading.showToast('密码错误');
    } else if (state == 2000) {
      EasyLoading.showToast('注册成功');
    } else if (state == 4000) {
      EasyLoading.showToast('用户已存在');
    }
  }

  static String? detectPwd(String? e) {
    if (e!.isEmpty) return "密码不能为空";

    if (Utils.match(e, RegExpValues.password)) {
      return null;
    } else {
      return "格式：${DetectValues.pwd}";
    }
  }

  static String? detectUname(String? e) {
    if (e!.isEmpty) return "密码不能为空";

    if (Utils.match(e, RegExpValues.uname)) {
      return null;
    } else {
      return "格式：${DetectValues.uname}";
    }
  }

  static String? detectEmail(String? e) {
    if (e!.isEmpty) return "邮箱不能为空";

    if (Utils.match(e, RegExpValues.email)) {
      return null;
    } else {
      return "格式：${DetectValues.email}";
    }
  }

  static String? detectPhone(String? e) {
    if (e!.isEmpty) return "手机号不能为空";

    if (Utils.match(e, RegExpValues.phone)) {
      return null;
    } else {
      return "格式：${DetectValues.phone}";
    }
  }

  static String? reDetectPwd(String? e, String rePwd) {
    if (rePwd != e) {
      return "两次密码不一致";
    } else {
      return Utils.detectPwd(e);
    }
  }
}