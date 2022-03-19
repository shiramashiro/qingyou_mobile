import 'package:dio/dio.dart';
import 'package:qingyuo_mobile/apis/http.dart';

/// 上传文件的接口。
class UploadApi extends Http {
  Future updateAvatar(FormData formData) {
    return dio.post('$baseURL/users/update/avatar', data: formData);
  }
}
