import 'package:flutter/material.dart';

import '../components/text_divider.dart';
import '../http/http.dart';
import '../models/user.dart';
import '../utils/utils.dart';
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

  double textFiledFontSize = 14;
  String httpUrl = "http://localhost:8080/users/reg";

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
                  Utils.route(context, const LoginPage());
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const Text('注册'),
            ],
          )),
      body: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.fromLTRB(55, 50, 55, 0),
          child: Column(
            children: [
              SizedBox(
                height: 85,
                child: TextFormField(
                  controller: unameCtrl,
                  validator: (e) => Utils.detectUname(e),
                  minLines: 1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(),
                    labelStyle: TextStyle(fontSize: textFiledFontSize),
                    hintStyle: TextStyle(fontSize: textFiledFontSize),
                    labelText: '用户名',
                    hintText: '请输入用户名',
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
              SizedBox(
                height: 85,
                child: TextFormField(
                  controller: phoneCtrl,
                  validator: (e) => Utils.detectPhone(e),
                  minLines: 1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(),
                    labelStyle: TextStyle(fontSize: textFiledFontSize),
                    hintStyle: TextStyle(fontSize: textFiledFontSize),
                    labelText: '手机号',
                    hintText: '输入手机号码',
                    prefixIcon: const Icon(Icons.phone),
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
              SizedBox(
                height: 85,
                child: TextFormField(
                  controller: passwordCtrl,
                  validator: (e) => Utils.detectPwd(e),
                  minLines: 1,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(),
                    labelStyle: TextStyle(fontSize: textFiledFontSize),
                    hintStyle: TextStyle(fontSize: textFiledFontSize),
                    labelText: '密码',
                    hintText: '请输入密码',
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
              SizedBox(
                height: 85,
                child: TextFormField(
                  controller: rePasswordCtrl,
                  validator: (e) => Utils.reDetectPwd(e, passwordCtrl.text),
                  minLines: 1,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(),
                    labelStyle: TextStyle(fontSize: textFiledFontSize),
                    hintStyle: TextStyle(fontSize: textFiledFontSize),
                    labelText: '确认密码',
                    hintText: '再次输入密码以确保密码一致',
                    prefixIcon: const Icon(Icons.lock_open),
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

              /// 注册按钮
              Container(
                margin: const EdgeInsets.only(top: 35),
                child: MaterialButton(
                  onPressed: () {
                    if ((formKey.currentState as FormState).validate()) {
                      Http().register(
                        httpUrl,
                        User(
                            uname: unameCtrl.text,
                            phone: phoneCtrl.text,
                            psw: rePasswordCtrl.text),
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
                    '注册',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

              /// 分割线
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: const TextDivider('快捷注册'),
              ),

              /// 快捷登录
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: SizedBox(
                        width: 55,
                        height: 55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('assets/icons/alipay.png'),
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              '支付宝',
                              style: TextStyle(
                                fontSize: 12,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('assets/icons/wechat.png'),
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              '微信',
                              style: TextStyle(
                                fontSize: 12,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('assets/icons/qq.png'),
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'QQ',
                              style: TextStyle(
                                fontSize: 12,
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
        ),
      ),
    );
  }
}
