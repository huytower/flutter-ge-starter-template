import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

enum DioMethod { post, get, put, delete }

class APIService {

  APIService._singleton();
  static final APIService instance = APIService._singleton();

  String get baseUrl {
    return 'https://reqres.in';
  }

  Future<Response> request(
      String endpoint,
      DioMethod method, {
        Map<String, dynamic>? param,
        String? contentType,
        formData,
      }) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 5000)
        ),
      );
      dio.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            // All http responses enabled for console logging
            printResponseData: true,
            // All http requests disabled for console logging
            printRequestData: true,
            // Reposnse logs including http - headers
            printResponseHeaders: true,
            // Request logs without http - headersa
            printRequestHeaders: true,
          ),
        )
      );

      switch (method) {
        case DioMethod.post:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.get:
          return dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}