import 'package:flutter/cupertino.dart';
import 'package:qingyuo_mobile/models/user_model.dart';
import 'package:qingyuo_mobile/utils/detection.dart';

class LoginService {
  bool isUname = false;
  bool isPhone = false;
  bool isEmail = false;

  /// @desc: 封装表单数据
  /// @author: shiramashiro
  /// @date: 2022/3/4
  User encapsulateData(TextEditingController pswCtrl, TextEditingController accCtrl) {
    User user;
    if (isUname) {
      user = User(psw: pswCtrl.text, uname: accCtrl.text);
    } else if (isEmail) {
      user = User(psw: pswCtrl.text, email: accCtrl.text);
    } else {
      user = User(psw: pswCtrl.text, phone: accCtrl.text);
    }
    return user;
  }

  /// @desc: 验证账号格式是否正确
  /// @author: shiramashiro
  /// @date: 2022/3/3
  String? detectAccount(String? e) {
    /// 如果账号未输入，下面的步骤全部终止进行。
    if (e!.isEmpty) return "账号不能为空";

    isPhone = Detection.match(e, RegExpValues.phone);
    isEmail = Detection.match(e, RegExpValues.email);

    /// 用户名的正则表达式中包含了数字，所以通常情况下，用户名与手机号的正则都匹配。
    ///
    /// 手机号为 true，用户名也为 true（开头解释了原因），无法分辨用户输入的是手机号还是用户名。
    /// 假设，用户想通过手机号方式登录，[isUname] 应该为 false。
    ///
    /// 手机号为 false，用户名为 true，结果返回 false。说明用户正在以用户名的方式进行输入，因此再取反，最终为 true。
    /// 手机号为 true，用户名为 true，结果返回 true，说明用户正在以手机号的方式进行输入，因此再取反，最终为 false。
    isUname = !(isPhone && Detection.match(e, RegExpValues.uname));

    if (isUname == true && isEmail == false && isPhone == false) {
      if (Detection.match(e, RegExpValues.uname2Phone)) {
        isUname = false;
        if (Detection.match(e, RegExpValues.phone)) {
          return null;
        } else {
          return DetectValues.phone;
        }
      } else {
        return null;
      }
    } else if (isUname == true && isEmail == true && isPhone == false) {
      if (RegExp(r'@').hasMatch(e)) {
        isUname = false;
        if (Detection.match(e, RegExpValues.email)) {
          return null;
        } else {
          return DetectValues.email;
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
