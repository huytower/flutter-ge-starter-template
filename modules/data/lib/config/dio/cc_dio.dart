import '../interceptor/cc_interceptor.dart';
import 'package:dio/dio.dart';

Dio ccDio() {
  var _dio = Dio(
    BaseOptions(
      /// baseUrl: NOT DEFINE HERE, FOLLOW RETROFIT ANNOTATION

      /// Set default timeout for retrofit.
      connectTimeout: const Duration(seconds: 40),
      receiveTimeout: const Duration(seconds: 40),
      sendTimeout: const Duration(seconds: 40),
    ),
  );

  _dio.interceptors.addAll(ccInterceptors());

  return _dio;
}