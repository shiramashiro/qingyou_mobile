import 'package:qingyuo_mobile/models/user_model.dart';

class RegisterPageService {
  User encapsulateData(String uname, String phone, String psw) {
    return User(
      uname: uname,
      phone: phone,
      psw: psw,
    );
  }
}
