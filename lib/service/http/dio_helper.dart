import 'package:dio/dio.dart';

import 'package:transport_app/service/http/interceptor.dart';

class DioApi {
  late final Dio dio = createDio();
  DioApi._internal();
  static final singleton = DioApi._internal();
  factory DioApi() => singleton;
  Dio createDio() {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: 30000, // for 30 seconds
        receiveTimeout: 30000,
        sendTimeout: 30000,
      ),
    );
    dio.interceptors.add(ApiInterceptor(dio));
    return dio;
  }
}
