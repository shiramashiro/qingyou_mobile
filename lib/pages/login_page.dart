import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/qy_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double left = 55;
  double right = 55;
  double fontSize = 12;
  MainAxisAlignment spaceBetween = MainAxisAlignment.spaceBetween;
  MainAxisAlignment center = MainAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 头像
          Container(
            margin: EdgeInsets.fromLTRB(left, 30, right, 0),
            width: 95,
            height: 95,
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/95893409_p0.jpg"),
            ),
          ),

          /// 账号输入框
          Container(
            margin: EdgeInsets.fromLTRB(left, 80, right, 10),
            height: 40,
            child: const QYInput(
              autoFocus: true,
              prefixIcon: Icons.account_circle,
              labelText: "账号",
              hintText: "请输入手机号/邮箱/用户名",
            ),
          ),

          /// 密码输入框
          Container(
            margin: EdgeInsets.fromLTRB(left, 0, right, 10),
            height: 40,
            child: const QYInput(
              obscureText: true,
              prefixIcon: Icons.lock,
              labelText: "密码",
              hintText: "请输入账号密码",
            ),
          ),

          /// 其他服务
          Container(
            margin: EdgeInsets.fromLTRB(left, 0, right, 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '密码找回',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
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
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 登录按钮
          MaterialButton(
            onPressed: () {},
            padding: const EdgeInsets.all(25),
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.lightBlue,
                width: 1.5,
              ),
            ),
            child: const Text(
              '登录',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ),

          /// 分割线
          Container(
            margin: EdgeInsets.fromLTRB(left, 80, right, 0),
            child: Divider(),
          ),

          /// 快捷登录
          Container(
            margin: EdgeInsets.fromLTRB(left, 5, right, 5),
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
                            fontSize: fontSize,
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
                            fontSize: fontSize,
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
                            fontSize: fontSize,
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
