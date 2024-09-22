import 'dart:io';

import 'package:app_config/config/app_config/cc_app_config.dart';
// import 'package:data/datasource/local/home/home_database.dart';
// import 'package:data/datasource/local/setting/setting_database.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import '../../dio/cc_dio.dart';
import '../../interceptor/cc_interceptor.dart';

@module
abstract class DataModule {
  // @preResolve
  // Future<HomeDatabase> get homeDatabase async {
  //   return $FloorHomeDatabase.databaseBuilder('home_database.db').build();
  // }

  // @preResolve
  // Future<SettingDatabase> get settingDatabase async {
  //   return $FloorSettingDatabase.databaseBuilder('setting_database.db').build();
  // }

  //region Register dependency name
  @Named("baseUrl")
  String get baseUrl => CcAppHostUrlName.baseUrl;

  @Named("baseUrlOther")
  String get baseUrlOther => CcAppHostUrlName.baseUrlOther;

  @singleton
  Dio dio(@Named('baseUrl') String baseUrl) {
    var _dio = Dio(
      BaseOptions(
        /// baseUrl: NOT DEFINE HERE, FOLLOW RETROFIT ANNOTATION
baseUrl: baseUrl,
        /// Set default timeout for retrofit.
        connectTimeout: const Duration(seconds: 40),
        receiveTimeout: const Duration(seconds: 40),
        sendTimeout: const Duration(seconds: 40),
      ),
    );

    _dio.interceptors.addAll(ccInterceptors());

    return _dio;
  }
  // Dio dio = ccDio();
}