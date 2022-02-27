import 'package:flutter/material.dart';

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
            child: ClipOval(
              child: Image(
                image: AssetImage('assets/images/95893409_p0.jpg'),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 账号输入框
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 40.0),
            height: 60,
            child: const TextField(
              minLines: 1,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "账号",
                hintText: "请输入您的用户名/手机号码/邮箱",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
            margin: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 40.0),
            height: 60,
            child: const TextField(
              minLines: 1,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入您的密码",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  borderSide: BorderSide(
                    color: Colors.lightBlue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),

          /// 登陆按钮
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0),
            child: Center(
              child: ClipOval(
                child: InkWell(
                  onTap: () {},
                  // 水波纹的圆形
                  borderRadius: BorderRadius.circular(50.0),
                  // 点击之后水波纹的颜色
                  highlightColor: const Color.fromRGBO(3, 169, 244, 0.25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(50, 50, 50, 0.5),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '登录',
                        style: TextStyle(fontSize: 16.0, color: Colors.black87),
                      ),
                    ),
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ),
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
