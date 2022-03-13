import 'package:flutter/foundation.dart';

class ImagePickProvider with ChangeNotifier {
  dynamic _image;

  dynamic get getImage => _image;

  void setImage(dynamic image) {
    _image = image;
    notifyListeners();
  }
}
