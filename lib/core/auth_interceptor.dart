import 'package:dio/dio.dart';
import '../main.dart';
import 'exeptions.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, handler) async {
    if (err is BadRequest) {
      throw err;
    }

    print(err);
    return super.onError(err, handler);
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
