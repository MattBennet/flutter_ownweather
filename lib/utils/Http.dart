// @dart=2.9
import 'package:dio/dio.dart';
import 'package:flutter_ownweather/core/auth_interceptor.dart';

class Http {
  static Dio _instance;
  static const HOST = "https://api.openweathermap.org/data/2.5/";

  static Dio getInstance() {
    if (_instance == null) {
      _instance = Dio(BaseOptions(
        baseUrl: "https://api.openweathermap.org/data/2.5/",
        contentType: "application/json",
      ));
      _instance.interceptors.add(AuthInterceptor());
      _instance.interceptors.add(
        LogInterceptor(
            responseBody: true, requestBody: true, responseHeader: true),
      );
    }

    return _instance;
  }
}
