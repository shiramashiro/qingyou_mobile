import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingyuo_mobile/apis/common_api.dart';
import 'package:qingyuo_mobile/models/user_model.dart';
import 'package:qingyuo_mobile/apis/utils/http_response.dart';

class RegisterPageService {
  final CommonApi _api = CommonApi();

  void register(
    TextEditingController uname,
    TextEditingController phone,
    TextEditingController password,
  ) {
    Future future = _api.register(_packRegisterFormData(uname, phone, password));
    HttpResponse().handleFutureByLoading(
      onFutureBefore: () => EasyLoading.show(status: '注册中...'),
      doFuture: future,
    );
  }

  User _packRegisterFormData(
    TextEditingController uname,
    TextEditingController phone,
    TextEditingController password,
  ) {
    return User(uname: uname.text, phone: phone.text, psw: password.text);
  }
}
