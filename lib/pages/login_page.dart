import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/qy_avatar.dart';
import 'package:qingyuo_mobile/components/qy_button_circle.dart';
import 'package:qingyuo_mobile/components/qy_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: QYAvatar(
              uri: AssetImage("assets/images/95893409_p0.jpg"),
            ),
          ),

          /// 账号输入框
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 40.0),
            height: 60,
            child: const QYInput(
              Icons.account_circle,
              labelText: "账号",
              hintText: "请输入手机号/邮箱/用户名",
            ),
          ),

          /// 密码输入框
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 40.0),
            height: 60,
            child: const QYInput(
              Icons.lock,
              labelText: "密码",
              hintText: "请输入账号密码",
              obscureText: true,
            ),
          ),

          /// 登陆按钮
          QYButtonCircle(
            "登录",
            onTap: () {},
            textStyle: const TextStyle(fontSize: 16.0, color: Colors.black87),
            margin: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0),
          ),

          /// 其他服务
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '返回首页',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: 1,
                    height: 12,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                  ),
                  Text(
                    '密码找回',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: 1,
                    height: 12,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                  ),
                  Text(
                    '新用户注册',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
