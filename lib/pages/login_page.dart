import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/apis/login_api.dart';
import 'package:qingyuo_mobile/pages/register_page.dart';
import 'package:qingyuo_mobile/service/login_service.dart';

import '../components/text_divider.dart';
import '../components/circle_button.dart';
import '../utils/utils.dart';
import 'root_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MainAxisAlignment center = MainAxisAlignment.center;
  MainAxisAlignment spaceBetween = MainAxisAlignment.spaceBetween;

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

  Widget _createInput(
      {required TextEditingController controller,
      double fontSize = 14,
      required String label,
      required String hint,
      required IconData icon,
      bool obscure = false,
      required Function validator}) {
    return SizedBox(
      height: 85,
      child: TextFormField(
        controller: controller,
        validator: (e) {
          return validator(e);
        },
        obscureText: obscure,
        minLines: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(),
          labelStyle: TextStyle(fontSize: fontSize),
          hintStyle: TextStyle(fontSize: fontSize),
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon),
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
    );
  }

  Widget _createTextButton({
    required String text,
    double fontSize = 14,
    required Function onTap,
  }) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey,
          fontSize: fontSize,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _createFastLogInButton({
    required String text,
    required String imagePath,
  }) {
    return GestureDetector(
      child: SizedBox(
        width: 55,
        height: 55,
        child: Column(
          mainAxisAlignment: center,
          children: [
            Image(
              image: AssetImage(imagePath),
              width: 30,
              height: 30,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAvatar({
    double width = 100,
    double height = 100,
    required String imagePath,
  }) {
    return SizedBox(
      width: 100,
      height: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
    );
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
            _createAvatar(
              imagePath: "assets/images/95893409_p0.jpg",
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    _createInput(
                      validator: (e) {
                        return service.detectAccount(e);
                      },
                      controller: accCtrl,
                      label: '账号',
                      hint: '输入手机号/邮箱/用户名',
                      icon: Icons.account_circle,
                    ),
                    _createInput(
                      validator: (e) {
                        return Utils.detectPwd(e);
                      },
                      controller: pwdCtrl,
                      obscure: true,
                      label: '密码',
                      hint: '请输入账号密码',
                      icon: Icons.lock,
                    ),
                    Row(
                      mainAxisAlignment: spaceBetween,
                      children: [
                        _createTextButton(
                          text: '密码找回',
                          onTap: () {},
                        ),
                        _createTextButton(
                          text: '用户注册',
                          onTap: () {
                            Utils.route(context, const RegisterPage());
                          },
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
              mainAxisAlignment: spaceBetween,
              children: [
                _createFastLogInButton(text: '支付宝', imagePath: 'assets/icons/alipay.png'),
                _createFastLogInButton(text: '微信', imagePath: 'assets/icons/wechat.png'),
                _createFastLogInButton(text: 'QQ', imagePath: 'assets/icons/qq.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
