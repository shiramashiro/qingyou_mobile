import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/apis/login_api.dart';
import 'package:qingyuo_mobile/service/login_service.dart';

import '../apis/http.dart';
import '../components/text_divider.dart';
import '../utils/utils.dart';
import 'register_page.dart';
import 'root_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  String url = "http://localhost:8080/users/login";

  TextEditingController accCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    EasyLoading.instance
      ..radius = 20
      ..maskType = EasyLoadingMaskType.clear
      ..loadingStyle = EasyLoadingStyle.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 181, 207, 6),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Utils.route(context, const RootPage());
              },
              icon: const Icon(Icons.arrow_back),
            ),
            const Text('登陆'),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(55, 50, 55, 0),
        child: Column(
          children: [
            /// 头像
            const SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/95893409_p0.jpg"),
              ),
            ),

            /// 表单
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    /// 账号输入框
                    SizedBox(
                      height: 85,
                      child: TextFormField(
                        controller: accCtrl,
                        validator: (e) {
                          return LoginService().detectAccount(e);
                        },
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
                    SizedBox(
                      height: 85,
                      child: TextFormField(
                        controller: pwdCtrl,
                        validator: (e) {
                          return Utils.detectPwd(e);
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

                    /// 密码找回和用户注册
                    Row(
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
                          onPressed: () {
                            Utils.route(context, const RegisterPage());
                          },
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

                    /// 登录按钮
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 0),
                      child: MaterialButton(
                        onPressed: () {
                          if ((formKey.currentState as FormState).validate()) {
                            LoginApi().login(
                              url,
                              LoginService().encapsulateData(pwdCtrl, accCtrl),
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
                    ),
                  ],
                ),
              ),
            ),

            /// 分割线
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 20),
              child: const TextDivider('快捷登录'),
            ),

            /// 快捷登录
            Row(
              mainAxisAlignment: spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
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
                  onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
