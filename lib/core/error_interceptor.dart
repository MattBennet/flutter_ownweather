import 'package:dio/dio.dart';
import 'package:flutter_ownweather/utils/strings.dart';
import 'exeptions.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  onError(DioError err, handler) {
    if (err.response == null) {
      return handler.reject(NoInternetConnection());
    }

    var statusCode = err.response.statusCode;

    if (statusCode == 400) {
      return handler
          .reject(BadRequest(err.response.data ?? Strings.unknownError));
    }

    if (statusCode >= 500 && statusCode <= 599) {
      return handler.reject(ServerInternal());
    }

    if (statusCode == 404) {
      return handler.reject(NotFound());
    }

    if (statusCode > 401 && statusCode <= 499) {
      return handler.reject(UnknownError());
    }

    super.onError(err, handler);
  }
}
