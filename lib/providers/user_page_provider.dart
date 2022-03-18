import 'package:flutter/foundation.dart';

class UserPageProvider with ChangeNotifier {
  dynamic _image;

  dynamic get getImage => _image;

  void setImage(dynamic image) {
    _image = image;
    notifyListeners();
  }
}
