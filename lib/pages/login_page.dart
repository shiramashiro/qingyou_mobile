import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double marginLeft = 55;
  double marginRight = 55;
  double inputHeight = 50;
  double fastLogInFontSize = 12;
  double textFiledFontSize = 14;
  MainAxisAlignment center = MainAxisAlignment.center;
  MainAxisAlignment spaceBetween = MainAxisAlignment.spaceBetween;
  GlobalKey formKey = GlobalKey<FormState>();

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
                    validator: (e) {
                      bool isPhone = RegExp(r"1[3|4|5|7|8][0-9]\d{4,8}$").hasMatch(e!);
                      bool isEmail = RegExp(r"[A-Za-z0-9\u4e00-\u9fa5]+").hasMatch(e);
                      if (e.isEmpty) {
                        return "账号不能为空！";
                      } else if (RegExp(r"\s+\b|\b\s").hasMatch(e)) {
                        return "账号不能包含空格！";
                      } else if (!isPhone) {
                        return "账号必须是正确的手机号！";
                      } else if (!isEmail) {
                        return "账号必须是正确的邮箱！";
                      }
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
                    validator: (e) {
                      String? msg;
                      if (e!.isEmpty) {
                        msg = "密码不能为空！";
                      } else if (e.characters.length <= 6) {
                        msg = "密码必须大于6位字符！";
                      } else if (RegExp(r"\s+\b|\b\s").hasMatch(e)) {
                        msg = "密码不能包含空格！";
                      }
                      return msg;
                    },
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
                  onPressed: () async {
                    if ((formKey.currentState as FormState).validate()) {
                      print('success!');
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
