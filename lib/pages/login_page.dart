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
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 40.0),
            child: const TextField(
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "账号",
                  hintText: "请输入您的用户名/手机号码/邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 40.0),
            child: const TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入您的密码",
                  prefixIcon: Icon(Icons.lock)),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0),
            child: Center(
              child: ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: const Center(
                    child: Text(
                      '登陆',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '密码找回',
                    style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                  Text(
                    '新用户注册',
                    style: TextStyle(fontSize: 15.0, color: Colors.grey),
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
