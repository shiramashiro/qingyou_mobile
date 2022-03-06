import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/utils/roadmap.dart';
import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/components/form_input.dart';
import 'package:qingyuo_mobile/components/text_icon.dart';
import 'package:qingyuo_mobile/components/underline_text_button.dart';
import 'package:qingyuo_mobile/components/text_divider.dart';
import 'package:qingyuo_mobile/components/circle_button.dart';
import 'package:qingyuo_mobile/apis/login_api.dart';
import 'package:qingyuo_mobile/service/login_service.dart';
import 'package:qingyuo_mobile/utils/detection.dart';
import 'register_page.dart';
import 'root_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController accCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();

  LoginService service = LoginService();
  LoginApi api = LoginApi();

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
                Roadmap.push(context, const RootPage());
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
            const Avatar(url: "assets/images/95893409_p0.jpg"),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    FormInput(
                      controller: accCtrl,
                      validator: (e) => service.detectAccount(e),
                      label: '账号',
                      hint: '输入手机号/邮箱/用户名',
                      icon: Icons.account_circle,
                    ),
                    FormInput(
                      controller: pwdCtrl,
                      obscure: true,
                      validator: (e) => Detection.detectPwd(e),
                      label: '密码',
                      hint: '请输入账号密码',
                      icon: Icons.lock,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UnderlineTextButton(text: '密码找回', onTap: () {}),
                        UnderlineTextButton(
                          text: '用户注册',
                          onTap: () => Roadmap.push(context, const RegisterPage()),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 0),
                      child: CircleButton(
                        text: '登录',
                        onTap: () {
                          if ((formKey.currentState as FormState).validate()) {
                            api.login(
                              'http://localhost:8080/users/login',
                              service.encapsulateData(
                                pwdCtrl,
                                accCtrl,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 20),
              child: const TextDivider('快捷登录'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextIcon(imagePath: "assets/icons/alipay.png", text: "支付宝"),
                TextIcon(imagePath: "assets/icons/wechat.png", text: "微信"),
                TextIcon(imagePath: "assets/icons/qq.png", text: "QQ"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
