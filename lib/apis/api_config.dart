import 'package:dio/dio.dart';

/// 所有的接口都需要使用到 Dio 以及基本的请求路径 baseURL。
/// 其他接口都需要继承 Http 类。
class APIConfig {
  final Dio dio = Dio();
  final String baseURL = "http://10.0.2.2:8080";
}
