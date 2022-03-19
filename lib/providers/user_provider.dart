import 'package:flutter/foundation.dart';
import 'package:qingyuo_mobile/models/user_model.dart';

class UserProvider with ChangeNotifier {
  late User _user;

  User get getUser => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
