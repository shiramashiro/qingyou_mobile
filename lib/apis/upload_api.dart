import 'package:dio/dio.dart';
import 'package:qingyuo_mobile/apis/http.dart';

class UploadApi extends Http {
  void uploadAvatar(FormData formData) {
    dio.post('$baseURL/users/update/avatar', data: formData);
  }
}
