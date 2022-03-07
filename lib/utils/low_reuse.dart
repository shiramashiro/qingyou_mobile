import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:qingyuo_mobile/apis/http.dart';

class LowReuse extends Http {
  /// @desc: 针对于登陆与注册，处理其返回的状态码，并提示相应的消息给用户
  /// @author: shiramashiro
  /// @date: 2022/3/5
  void thenSteps(Future future) {
    future.then((value) {
      EasyLoading.dismiss();
      httpThen(value);
    }, onError: (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast('未知错误');
    }).timeout(
      const Duration(milliseconds: 12000),
      onTimeout: () {
        EasyLoading.dismiss();
        EasyLoading.showToast('连接超时');
      },
    );
  }
}
