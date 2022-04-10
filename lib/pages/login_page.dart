import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qingyuo_mobile/components/app_bar_row_back.dart';
import 'package:qingyuo_mobile/service/login_page_service.dart';
import 'package:qingyuo_mobile/utils/roadmap.dart';
import 'package:qingyuo_mobile/components/avatar.dart';
import 'package:qingyuo_mobile/components/form_input.dart';
import 'package:qingyuo_mobile/components/text_icon.dart';
import 'package:qingyuo_mobile/components/underline_text_button.dart';
import 'package:qingyuo_mobile/components/text_divider.dart';
import 'package:qingyuo_mobile/components/circle_button.dart';
import 'package:qingyuo_mobile/utils/detection.dart';
import 'package:qingyuo_mobile/pages/register_page.dart';
import 'package:qingyuo_mobile/pages/roots/root_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _account = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final LoginPageService _service = LoginPageService();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height),
      context: context,
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      minTextAdapt: true,
      orientation: Orientation.portrait,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const AppBarRowBack(title: '登陆', widget: RootPage()),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0.12.sw, 0.05.sh, 0.12.sw, 0),
        // margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            const Avatar(url: "assets/images/95893409_p0.jpg"),
            Container(
              margin: EdgeInsets.only(top: 0.05.sh),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    FormInput(
                      controller: _account,
                      validator: (e) => _service.detectAccount(e),
                      label: '账号',
                      hint: '输入手机号/邮箱/用户名',
                      icon: Icons.account_circle,
                    ),
                    FormInput(
                      controller: _password,
                      obscure: true,
                      validator: (e) => Detection.detectPwd(e),
                      label: '密码',
                      hint: '请输入账号密码',
                      icon: Icons.lock,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UnderlineTextButton(text: '密码找回'),
                        UnderlineTextButton(
                          text: '用户注册',
                          onTap: () {
                            Roadmap.push(
                              context,
                              const RegisterPage(),
                            );
                          },
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.05.sh),
                      child: CircleButton(
                        text: '登录',
                        onTap: () {
                          if ((_formKey.currentState as FormState).validate()) {
                            _service.login(_password, _account, context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.05.sh, bottom: 0.02.sh),
              child: const TextDivider('快捷登录'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextIcon(iconPath: "assets/icons/alipay.svg", iconType: 'svg', text: "支付宝"),
                TextIcon(iconPath: "assets/icons/wechat.svg", iconType: 'svg', text: "微信"),
                TextIcon(iconPath: "assets/icons/qq.svg", iconType: 'svg', text: "QQ"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
