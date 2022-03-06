/// 正则表达式值，这里保存项目中需要用到的各种正则表达式。
/// 例如，手机号正则、用户名正则。
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

/// 保存着各种提示消息，比如，手机号的格式错误、电子邮箱的格式错误等。
class DetectValues {
  static const String pwd = "字母、数字、_-. 长度在6~16位";
  static const String uname = "字母、数字、_- 长度在4~20位";
  static const String email = "电子邮箱的格式是 xxxx@xx.xx";
  static const String phone = "手机号是11位数字";
}

class Detection {
  static bool match(String value, String regexp) {
    return RegExp(regexp).hasMatch(value);
  }

  static String? detectPwd(String? e) {
    if (e!.isEmpty) return "密码不能为空";

    if (e.length < 4) return "密码长度至少4位字符";

    if (Detection.match(e, RegExpValues.password)) {
      return null;
    } else {
      return "格式：${DetectValues.pwd}";
    }
  }

  static String? detectUname(String? e) {
    if (e!.isEmpty) return "用户名不能为空";

    if (e.length < 4) return "用户名长度至少4位字符";

    if (Detection.match(e, RegExpValues.uname)) {
      return null;
    } else {
      return "格式：${DetectValues.uname}";
    }
  }

  static String? detectEmail(String? e) {
    if (e!.isEmpty) return "邮箱不能为空";

    if (Detection.match(e, RegExpValues.email)) {
      return null;
    } else {
      return "格式：${DetectValues.email}";
    }
  }

  static String? detectPhone(String? e) {
    if (e!.isEmpty) return "手机号不能为空";

    if (Detection.match(e, RegExpValues.phone)) {
      return null;
    } else {
      return "格式：${DetectValues.phone}";
    }
  }

  static String? reDetectPwd(String? e, String rePwd) {
    if (rePwd != e) {
      return "两次密码不一致";
    } else {
      return Detection.detectPwd(e);
    }
  }
}
