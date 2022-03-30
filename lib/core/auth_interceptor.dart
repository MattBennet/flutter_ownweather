import 'package:dio/dio.dart';
import 'package:flutter_ownweather/domain/Error.dart';
import 'exeptions.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, handler) async {
    {
      if (err.response == null) {
        handler.reject(NoInternetConnection());
      }

      var statusCode = err.response?.statusCode;

      if (statusCode == 400) {
        handler.reject(BadRequest(
          Error.fromJson(err.response.data),
        ));
      }

      if (statusCode >= 500 && statusCode <= 599) {
        handler.reject(ServerInternal());
      }

      if (statusCode == 404) {
        handler.reject(NotFound());
      }

      if (statusCode > 401 && statusCode <= 499) {
        handler.reject(UnknownError());
      }
      print(err);
      handler.next(err);
    }
  }

  @override
  void onRequest(RequestOptions options, handler) async {
    options.queryParameters
        .addAll({"appid": "162e170585631b027f9a67c8ebd53852"});

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, handler) async {
    super.onResponse(response, handler);
  }
}
