// @dart=2.9
import 'package:flutter_ownweather/domain/Error.dart';

import 'package:dio/dio.dart';
class NetworkException extends DioError {
  NetworkException() : super(requestOptions: RequestOptions(path: ''));
}

class BadRequest extends NetworkException {
  Error errors;

  BadRequest(this.errors);

  String getError(String key) {
    if (errors.errors == null) return null;
    final value = errors.errors[key];
    if (value != null) {
      errors.errors?.remove(key);
    }

    return value;
  }

  String getErrMsg() {
    return errors.errors.values.join(".\n") ?? "";
  }
}

class NotFound extends UnknownError {}

class ServerInternal extends NetworkException {}

class NoInternetConnection extends NetworkException {}

class AlreadyExists extends UnknownError {
  Map<String, dynamic> json;

  AlreadyExists(this.json);
}

class UnknownError extends NetworkException {}