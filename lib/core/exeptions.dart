// @dart=2.9

import 'package:dio/dio.dart';

class NetworkException extends DioError {
  NetworkException();
}

class BadRequest extends NetworkException {
  Error errors;

  BadRequest(this.errors);
}

class NotFound extends UnknownError {}

class ServerInternal extends NetworkException {}

class NoInternetConnection extends NetworkException {}

class UnknownError extends NetworkException {}
