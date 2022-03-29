import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/apis/common_api.dart';
import 'package:qingyuo_mobile/database/sqlite_operation.dart';
import 'package:qingyuo_mobile/models/user_model.dart';
import 'package:qingyuo_mobile/utils/detection.dart';
import 'package:qingyuo_mobile/apis/http/http_response.dart';

class LoginPageService {
  bool _isUname = false;
  bool _isPhone = false;
  bool _isEmail = false;
  final CommonAPI _api = CommonAPI();

  void login(TextEditingController password, TextEditingController account) {
    HttpResponse().handleFutureByLoading(
      onBefore: () => EasyLoading.show(status: '登录中...'),
      onDoing: _api.login(_babelData(password, account)),
      onSuccess: (user) => _updateDatabase(user),
    );
  }

  _updateDatabase(Map<String, dynamic> user) async {
    var table = 'userinfo';
    var op = SQLiteOperation(table: table);
    var exists = await op.existence();
    var sqlite = await op.connectSQLite();
    if (exists) {
      sqlite.update(table, user);
    } else {
      op.createTable(model: user);
      sqlite.insert(table, user);
    }
  }

  User _babelData(TextEditingController password, TextEditingController account) {
    User user;
    if (_isUname) {
      user = User(psw: password.text, uname: account.text);
    } else if (_isEmail) {
      user = User(psw: password.text, email: account.text);
    } else {
      user = User(psw: password.text, phone: account.text);
    }
    return user;
  }

  String? detectAccount(String? e) {
    if (e!.isEmpty) return "账号不能为空";

    _isPhone = Detection.match(e, RegExpValues.phone);
    _isEmail = Detection.match(e, RegExpValues.email);

    /// 用户名的正则表达式中包含了数字，所以通常情况下，用户名与手机号的正则都匹配。
    ///
    /// 手机号为 true，用户名也为 true（开头解释了原因），无法分辨用户输入的是手机号还是用户名。
    /// 假设，用户想通过手机号方式登录，[isUname] 应该为 false。
    ///
    /// 手机号为 false，用户名为 true，结果返回 false。说明用户正在以用户名的方式进行输入，因此再取反，最终为 true。
    /// 手机号为 true，用户名为 true，结果返回 true，说明用户正在以手机号的方式进行输入，因此再取反，最终为 false。
    _isUname = !(_isPhone && Detection.match(e, RegExpValues.uname));

    if (_isUname == true && _isEmail == false && _isPhone == false) {
      if (Detection.match(e, RegExpValues.uname2Phone)) {
        _isUname = false;
        if (Detection.match(e, RegExpValues.phone)) {
          return null;
        } else {
          return DetectValues.phone;
        }
      } else {
        if (e.length < 4) {
          return "账号长度至少4位字符";
        } else {
          return null;
        }
      }
    } else if (_isUname == true && _isEmail == true && _isPhone == false) {
      if (RegExp(r'@').hasMatch(e)) {
        _isUname = false;
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
