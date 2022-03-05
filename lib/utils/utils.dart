import 'package:flutter/material.dart';

class RegExpValues {
  static const String phone =
      r"^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$";

  static const String email =
      r"^[a-z]([a-z0-9]*[-_\.]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$";

  static const String uname = r"[a-zA-Z0-9_-]{4,20}";

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
  bool _isUname = false;
  bool _isPhone = false;
  bool _isEmail = false;

  bool get isUname => _isUname;

  bool get isPhone => _isPhone;

  bool get isEmail => _isEmail;

  static void route(dynamic context, dynamic widget) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) => widget), (route) => false);
  }

  static bool match(String value, String regexp) {
    return RegExp(regexp).hasMatch(value);
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

  /// @desc: 验证账号格式是否正确
  /// @author: shiramashiro
  /// @date: 2022/3/3
  String? detectAccount(String? e) {
    /// 如果账号未输入，下面的步骤全部终止进行。
    if (e!.isEmpty) return "账号不能为空";

    _isPhone = match(e, RegExpValues.phone);
    _isEmail = match(e, RegExpValues.email);

    /// 用户名的正则表达式中包含了数字，所以通常情况下，用户名与手机号的正则都匹配。
    ///
    /// 手机号为 true，用户名也为 true（开头解释了原因），无法分辨用户输入的是手机号还是用户名。
    /// 假设，用户想通过手机号方式登录，[isUname] 应该为 false。
    ///
    /// 手机号为 false，用户名为 true，结果返回 false。说明用户正在以用户名的方式进行输入，因此再取反，最终为 true。
    /// 手机号为 true，用户名为 true，结果返回 true，说明用户正在以手机号的方式进行输入，因此再取反，最终为 false。
    _isUname = !(_isPhone && match(e, RegExpValues.uname));

    if (_isUname && _isEmail) {
      if (RegExp(r"@").hasMatch(e)) {
        _isUname = false;
        return null;
      }
    }

    // 当匹配到用户名时，需要做以下几点操作，确保是否为用户名
    if (_isUname) {
      // 如果用户名有手机号开头几位，例如 185，就说明用户输入的手机号
      if (match(e, RegExpValues.uname2Phone)) {
        if (!_isPhone) {
          // 但是最开始作了一个手机号验证，没有输入完整时，会提示电话个事有误
          return "你输入的电话格式有误";
        } else {
          // 如果输入的电话正确，且包含了手机号前3位数时不提示错误
          return null;
        }
        // 如果用户名没有手机号开头的几位，就说明是除了手机号外的两种类型
      } else {
        // 判断是否包含@符号，如果是就说明正在以邮箱输入，但是没有输入完整
        if (match(e, r'@')) {
          // 没有输入完整，就说明并不匹配邮箱格式
          if (!_isEmail) {
            return "你输入的邮箱格式有误";
            // 如果匹配成功，就不提示错误
          } else {
            return null;
          }
        }

        // 如果不包含@符号，就说明是一个用户名输入，并且判断是否大于或等于6位字符
        if (e.characters.length < 6) {
          return "用户名不能少于6位字符";
        } else {
          return null;
        }
      }
    } else {
      if (_isPhone) {
        return null;
      } else {
        return "你输入的用户名格式有误";
      }
    }
  }
}
