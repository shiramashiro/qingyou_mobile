import 'package:flutter/material.dart';
import 'package:qingyuo_mobile/utils/roadmap.dart';
import 'package:qingyuo_mobile/components/circle_button.dart';
import 'package:qingyuo_mobile/components/form_input.dart';
import 'package:qingyuo_mobile/components/text_icon.dart';
import 'package:qingyuo_mobile/components/text_divider.dart';
import 'package:qingyuo_mobile/service/register_service.dart';
import 'package:qingyuo_mobile/apis/register_api.dart';
import 'package:qingyuo_mobile/utils/detection.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController unameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController rePasswordCtrl = TextEditingController();

  GlobalKey formKey = GlobalKey();
  GlobalKey textFormFiledKey = GlobalKey();

  RegisterService service = RegisterService();
  RegisterApi api = RegisterApi();

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
                Roadmap.push(context, const LoginPage());
              },
              icon: const Icon(Icons.arrow_back),
            ),
            const Text('注册'),
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.fromLTRB(55, 50, 55, 0),
          child: Column(
            children: [
              FormInput(
                controller: unameCtrl,
                validator: (e) => Detection.detectUname(e),
                label: '用户名',
                hint: '请输入用户名',
                icon: Icons.account_circle,
              ),
              FormInput(
                controller: phoneCtrl,
                validator: (e) => Detection.detectPhone(e),
                label: '手机号',
                hint: '输入手机号码',
                icon: Icons.phone,
              ),
              FormInput(
                controller: passwordCtrl,
                obscure: true,
                validator: (e) => Detection.detectPwd(e),
                label: '密码',
                hint: '请输入密码',
                icon: Icons.lock,
              ),
              FormInput(
                controller: rePasswordCtrl,
                obscure: true,
                validator: (e) => Detection.reDetectPwd(e, passwordCtrl.text),
                label: '密码',
                hint: '再次输入密码以确保密码一致',
                icon: Icons.lock_open,
              ),
              Container(
                margin: const EdgeInsets.only(top: 35),
                child: CircleButton(
                  text: '注册',
                  onTap: () {
                    if ((formKey.currentState as FormState).validate()) {
                      api.register(
                        service.encapsulateData(
                            unameCtrl.text, phoneCtrl.text, rePasswordCtrl.text),
                      );
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
