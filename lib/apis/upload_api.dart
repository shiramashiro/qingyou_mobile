import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qingyuo_mobile/apis/http.dart';

class UploadApi extends Http {
  static const String _avatarPath = "http://localhost:8080/upload/avatar";

  void uploadAvatar(int id, String uname, XFile file) {
    FormData formData = FormData.fromMap({'id': id, 'uname': uname, 'file': file});
    dio.post(_avatarPath, data: formData);
  }
}
