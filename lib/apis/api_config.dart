import 'package:dio/dio.dart';

class APIConfig {
  final Dio dio = Dio();
  final String baseURL = "http://10.0.2.2:8080";
}
