import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/apis/primary_api.dart';
import 'package:qingyuo_mobile/models/user_model.dart';
import 'package:qingyuo_mobile/utils/http_response.dart';

class RegisterPageService {
  final PrimaryApi _api = PrimaryApi();

  void register(
    TextEditingController uname,
    TextEditingController phone,
    TextEditingController password,
  ) {
    Future future = _api.register(_packRegisterFormData(uname, phone, password));
    EasyLoading.show(status: '注册中...');
    HttpResponse().resByLoading(future);
  }

  User _packRegisterFormData(
    TextEditingController uname,
    TextEditingController phone,
    TextEditingController password,
  ) {
    return User(uname: uname.text, phone: phone.text, psw: password.text);
  }
}
