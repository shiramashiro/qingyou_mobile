import 'package:dio/dio.dart';
import 'package:qingyuo_mobile/apis/http.dart';

class UploadApi extends Http {
  static const String _avatarPath = "http://10.0.2.2:8080/upload/avatar";

  void uploadAvatar(FormData formData) {
    dio.post(_avatarPath, data: formData);
  }
}
