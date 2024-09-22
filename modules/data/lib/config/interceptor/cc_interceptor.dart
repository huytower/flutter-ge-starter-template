import 'package:cc_library/src/curl/curl_utils.dart';
import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import '../dio/cc_dio.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:widget/export/cc_ktx_export.dart';

Iterable<Interceptor> ccInterceptors() {
  final loggerCurl = CurlLoggerDioInterceptor(printOnSuccess: true);
  final loggerTalker = TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
    printResponseData: false,
  ));

  final cacheStore = MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576);
  final cacheOptions = CacheOptions(
    store: cacheStore,
    hitCacheOnErrorExcept: [], // for offline behaviour
  );
  final cache = DioCacheInterceptor(options: cacheOptions);

  return [
    // ccReqInterceptors,
    loggerCurl,
    loggerTalker,
    cache,
  ];
}

// TODO(huy): Add this interceptor.
// Interceptor get retry => RetryInterceptor(
//       dio: dio,
//       logPrint: print, // specify log function (optional)
//       retries: 3, // retry count (optional)
//       retryDelays: const [
// // set delays between retries (optional)
//         Duration(seconds: 1), // wait 1 sec before first retry
//         Duration(seconds: 2), // wait 2 sec before second retry
//         Duration(seconds: 3), // wait 3 sec before third retry
//       ],
//     );

String request = "";
var ccReqInterceptors = InterceptorsWrapper(
  onRequest: (options, handler) {
    'onRequest() '.Log();

    request = "";

    /// handle token invalid :
    /// call app get token.
    when(
      conditions: {
        options.headers.containsValue("empty"): () {
          options.headers = {};
        },
        options.headers.containsValue("host_es"): () {
          options.headers = {};
        }
      },
      orElse: () {
        options.headers = {};
      },
    );
    return handler.next(options);
  },
  onResponse: (response, handler) async {
    'onResponse() : response = $response'.Log();

    var _curl = await CurlUtils.instance.representation(response.requestOptions);

    if (CcAppConfigFlags.isEnableLoggerDio) {
      var url = "[Dio Interceptor]\n[Request: ${response.requestOptions.method}] : ${response.requestOptions.uri}\n";
      var body = "";
      request = url + body;
      var _message = "$request[Curl]:\n$_curl\n[Response: ${response.statusCode}]:\n ${response.data}";

      _message.Log("", true, "logger:###/");
    }
    return handler.next(response);
  },
  onError: (e, handler) {
    'onError() : $e'.Log();

    return handler.next(e);
  },
);
