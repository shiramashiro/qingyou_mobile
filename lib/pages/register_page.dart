import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/components/app_bar_row_back.dart';
import 'package:qingyuo_mobile/components/circle_button.dart';
import 'package:qingyuo_mobile/components/form_input.dart';
import 'package:qingyuo_mobile/components/text_icon.dart';
import 'package:qingyuo_mobile/components/text_divider.dart';
import 'package:qingyuo_mobile/service/register_page_service.dart';
import 'package:qingyuo_mobile/utils/detection.dart';
import 'package:qingyuo_mobile/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _uname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _rePassword = TextEditingController();
  final GlobalKey _formKey = GlobalKey();
  final RegisterPageService _service = RegisterPageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const AppBarRowBack(title: '登陆', widget: LoginPage()),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.fromLTRB(55, 50, 55, 0),
          child: Column(
            children: [
              FormInput(
                controller: _uname,
                validator: (e) => Detection.detectUname(e),
                label: '用户名',
                hint: '请输入用户名',
                icon: Icons.account_circle,
              ),
              FormInput(
                controller: _phone,
                validator: (e) => Detection.detectPhone(e),
                label: '手机号',
                hint: '输入手机号码',
                icon: Icons.phone,
              ),
              FormInput(
                controller: _password,
                obscure: true,
                validator: (e) => Detection.detectPwd(e),
                label: '密码',
                hint: '请输入密码',
                icon: Icons.lock,
              ),
              FormInput(
                controller: _rePassword,
                obscure: true,
                validator: (e) => Detection.reDetectPwd(e, _password.text),
                label: '密码',
                hint: '再次输入密码以确保密码一致',
                icon: Icons.lock_open,
              ),
              Container(
                margin: const EdgeInsets.only(top: 35),
                child: CircleButton(
                  text: '注册',
                  onTap: () {
                    if ((_formKey.currentState as FormState).validate()) {
                      _service.register(_uname, _phone, _rePassword);
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: const TextDivider('快捷注册'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TextIcon(iconPath: "assets/icons/alipay.png", text: "支付宝"),
                    TextIcon(iconPath: "assets/icons/wechat.png", text: "微信"),
                    TextIcon(iconPath: "assets/icons/qq.png", text: "QQ"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
