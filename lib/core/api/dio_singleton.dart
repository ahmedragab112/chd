import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static CookieJar? cookieJar;
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      dio!.options.headers = {'Content-Type': 'application/json'};

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    if (cookieJar == null) {
      cookieJar = CookieJar();
      dio?.interceptors.add(CookieManager(cookieJar!));
      dio?.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ));
    }
  }
}
