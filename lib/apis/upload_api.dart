import 'package:dio/dio.dart';
import 'package:qingyuo_mobile/apis/api_config.dart';

class UploadAPI extends APIConfig {
  Future updateAvatar(FormData formData) {
    return dio.post('$baseURL/users/update/avatar', data: formData);
  }
}
