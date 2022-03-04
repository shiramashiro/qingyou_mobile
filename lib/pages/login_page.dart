import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// 左外边距
  double marginLeft = 55;

  /// 右外边距
  double marginRight = 55;

  /// 输入框高度
  double inputHeight = 50;

  /// 快捷登录字体大小
  double fastLogInFontSize = 12;

  /// 文本字体大小
  double textFiledFontSize = 14;

  /// 主轴居中
  MainAxisAlignment center = MainAxisAlignment.center;

  /// 主轴均匀分布
  MainAxisAlignment spaceBetween = MainAxisAlignment.spaceBetween;

  /// Form 的 Key
  GlobalKey formKey = GlobalKey<FormState>();

  TextEditingController accCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();

  bool isUname = false;
  bool isEmail = false;
  bool isPhone = false;

  /// @desc: 验证账号格式是否正确
  /// @author: shiramashiro
  /// @date: 2022/3/3
  String? verifyAccount(String? e) {
    /// 如果账号未输入，下面的步骤全部终止进行。
    if (e!.isEmpty) return "账号不能为空";

    /// 声明手机号、用户名以及电子邮箱的正则表达式。
    String phoneRegExp = r"^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$";
    String unameRegExp = r"^[a-zA-Z0-9_-]{4,16}$";
    String emailRegExp =
        r"^[a-z]([a-z0-9]*[-_\.]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$";
    String uname2PhoneRegExp = r"^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])";

    /// 用户输入的账号是否符合手机号格式。
    isPhone = RegExp(phoneRegExp).hasMatch(e);

    isEmail = RegExp(emailRegExp).hasMatch(e);

    /// 用户名的正则表达式中包含了数字，所以通常情况下，用户名与手机号的正则都匹配。
    /// 对于这类情况，解决方案时：[isPhone] 和 [isUname] 进行且运算，最终结果取反。
    ///
    /// 假设场景：
    /// 手机号为 true，用户名也为 true（开头解释了原因），无法分辨用户输入的是手机号还是用户名。
    /// 假设，用户想通过手机号方式登录，[isUname] 应该为 false。
    ///
    /// 且运算原理：
    /// 如果第一个操作对象为 false，运算第二个操作对象，如果两个操作对象都为 false ，结果返回 false。
    /// 如果第一个操作对象为 true，运算第二个操作对象，如果操作对象为 false，结果返回 false；如果操作对象 true，结果返回 true。
    ///
    /// 综上所述：
    /// 手机号为 false，用户名为 true，结果返回 false。说明用户正在以用户名的方式进行输入，因此再取反，最终为 true。
    /// 手机号为 true，用户名为 true，结果返回 true，说明用户正在以手机号的方式进行输入，因此再取反，最终为 false。
    isUname = !(isPhone && RegExp(unameRegExp).hasMatch(e));

    // 当匹配到用户名时，需要做以下几点操作，确保是否为用户名
    if (isUname) {
      // 如果用户名有手机号开头几位，例如 185，就说明用户输入的手机号
      if (RegExp(uname2PhoneRegExp).hasMatch(e)) {
        if (!isPhone) {
          // 但是最开始作了一个手机号验证，没有输入完整时，会提示电话个事有误
          return "你输入的电话格式有误";
        } else {
          // 如果输入的电话正确，且包含了手机号前3位数时不提示错误
          return null;
        }
        // 如果用户名没有手机号开头的几位，就说明是除了手机号外的两种类型
      } else {
        // 判断是否包含@符号，如果是就说明正在以邮箱输入，但是没有输入完整
        if (RegExp(r"@").hasMatch(e)) {
          // 没有输入完整，就说明并不匹配邮箱格式
          if (!isEmail) {
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
      if (isPhone) {
        return null;
      } else {
        return "你输入的用户名格式有误";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 头像
          Container(
            margin: EdgeInsets.fromLTRB(marginLeft, 40, marginRight, 0),
            width: 100,
            height: 100,
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/95893409_p0.jpg"),
            ),
          ),

          /// 表单
          Form(
            key: formKey,
            child: Column(
              children: [
                /// 账号输入框
                Container(
                  margin: EdgeInsets.fromLTRB(marginLeft, 80, marginRight, 20),
                  child: TextFormField(
                    controller: accCtrl,
                    validator: (e) {
                      return verifyAccount(e);
                    },
                    autofocus: true,
                    minLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(),
                      labelStyle: TextStyle(fontSize: textFiledFontSize),
                      hintStyle: TextStyle(fontSize: textFiledFontSize),
                      labelText: '账号',
                      hintText: '请输入手机号/邮箱/用户名',
                      prefixIcon: const Icon(Icons.account_circle),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),

                /// 密码输入框
                Container(
                  margin: EdgeInsets.fromLTRB(marginLeft, 0, marginRight, 20),
                  child: TextFormField(
                    controller: pwdCtrl,
                    validator: (e) {},
                    obscureText: true,
                    minLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(),
                      labelStyle: TextStyle(fontSize: textFiledFontSize),
                      hintStyle: TextStyle(fontSize: textFiledFontSize),
                      labelText: '密码',
                      hintText: '请输入账号密码',
                      prefixIcon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),

                /// 其他服务
                Container(
                  margin: EdgeInsets.fromLTRB(marginLeft, 0, marginRight, 90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          '密码找回',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          '用户注册',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// 登录按钮
                MaterialButton(
                  onPressed: () {
                    if ((formKey.currentState as FormState).validate()) {
                      User user;
                      if (isUname) {
                        user = User(psw: pwdCtrl.text, uname: accCtrl.text);
                      } else if (isEmail) {
                        user = User(psw: pwdCtrl.text, email: accCtrl.text);
                      } else {
                        user = User(psw: pwdCtrl.text, phone: accCtrl.text);
                      }
                      Dio dio = Dio(BaseOptions());
                      Future res = dio.post(
                        'http://localhost:8080/users/login',
                        data: user,
                      );
                      EasyLoading.instance
                        ..radius = 20
                        ..maskType = EasyLoadingMaskType.clear
                        ..loadingStyle = EasyLoadingStyle.dark;
                      EasyLoading.show(status: '登录中...');
                      res.then((value) {
                        EasyLoading.dismiss();
                        var data = jsonDecode(value.toString());
                        if (data['state'] == 5000) {
                          EasyLoading.showToast('未知错误');
                        } else if (data['state'] == 5001) {
                          EasyLoading.showToast('用户不存在');
                        } else if (data['state'] == 5002) {
                          EasyLoading.showToast('密码错误');
                        }
                      }, onError: (e) {
                        EasyLoading.dismiss();
                      }).timeout(
                        const Duration(milliseconds: 15000),
                        onTimeout: () {
                          EasyLoading.dismiss();
                          EasyLoading.showToast('请求超时');
                        },
                      );
                    }
                  },
                  padding: const EdgeInsets.all(20),
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    '登录',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 分割线
          Container(
            margin: EdgeInsets.fromLTRB(marginLeft, 60, marginRight, 0),
            child: const Divider(
              height: 2,
            ),
          ),

          /// 快捷登录
          Container(
            margin: EdgeInsets.fromLTRB(marginLeft, 10, marginRight, 5),
            child: Row(
              mainAxisAlignment: spaceBetween,
              children: [
                GestureDetector(
                  child: SizedBox(
                    width: 55,
                    height: 55,
                    child: Column(
                      mainAxisAlignment: center,
                      children: [
                        const Image(
                          image: AssetImage('assets/icons/alipay.png'),
                          width: 30,
                          height: 30,
                        ),
                        Text(
                          '支付宝',
                          style: TextStyle(
                            fontSize: fastLogInFontSize,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: SizedBox(
                    width: 55,
                    height: 55,
                    child: Column(
                      mainAxisAlignment: center,
                      children: [
                        const Image(
                          image: AssetImage('assets/icons/wechat.png'),
                          width: 30,
                          height: 30,
                        ),
                        Text(
                          '微信',
                          style: TextStyle(
                            fontSize: fastLogInFontSize,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 55,
                    height: 55,
                    child: Column(
                      mainAxisAlignment: center,
                      children: [
                        const Image(
                          image: AssetImage('assets/icons/qq.png'),
                          width: 30,
                          height: 30,
                        ),
                        Text(
                          'QQ',
                          style: TextStyle(
                            fontSize: fastLogInFontSize,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
