import 'package:cc_library/extension/kotlin/when_expression.dart';
import 'package:app_config/config/app_config/network/header/header_model.dart';
import 'package:app_config/enum/environment.dart';

import '../../enum/routing_manager_enum.dart';
import 'api_env/app_config_base.dart';
import 'api_env/app_config_free.dart';
import 'api_env/app_config_prod.dart';
import 'api_env/app_config_uat.dart';

final isFreeEnv = CcAppConfig.environment == Environment.FREE_FAKE_API;
final isUatEnv = CcAppConfig.environment == Environment.UAT;

/// Application Configs., save all static vars for application
/// ex. boolean var., update status var., .v.v.
class CcAppConfig {
  /// Config logger end.
  static AppConfigBase instance = when(variable: CcAppConfig.environment, conditions: {
    Environment.FREE_FAKE_API: AppConfigFree(),
    Environment.UAT: AppConfigUat(),
    Environment.PROD: AppConfigProd(),
  });

  // static AppConfigBase instance = isUatEnv ? AppConfigUat() : AppConfigProd();

  /// TODO(ALL): switch testing API env. in here
  static Environment environment = Environment.FREE_FAKE_API;
// static Environment environment = Environment.UAT;
// static Environment environment = Environment.PROD;
}

class CcAppName {
  static String appName = when(variable: CcAppConfig.environment, conditions: {
    Environment.FREE_FAKE_API: Environment.FREE_FAKE_API.name,
    Environment.UAT: Environment.UAT.name,
    Environment.PROD: Environment.PROD.name,
  });
}

class CcAppRoutingManager {
  static RoutingManagerEnum defaultRoutingManager = RoutingManagerEnum.AUTO_ROUTE;

  bool get isAutoRoute => defaultRoutingManager == RoutingManagerEnum.AUTO_ROUTE;
}

class CcAppHostUrlName {
  /// Config host url for networking service || http parser || dio || retrofit
  /// TIPS : free fake api for testing
  /// ex. : https://mockland.dev/api/news/list
  static String baseUrl = when(variable: CcAppConfig.environment, conditions: {
    Environment.FREE_FAKE_API: AppConfigFree.baseUrl,
    Environment.UAT: AppConfigUat.baseUrl,
    Environment.PROD: AppConfigProd.baseUrl,
  });

  /// Beside above main host service url,
  /// This is second host service url (if has)
  static String baseUrlOther = when(variable: CcAppConfig.environment, conditions: {
    Environment.FREE_FAKE_API: AppConfigFree.baseUrlOther,
    Environment.UAT: AppConfigUat.baseUrlOther,
    Environment.PROD: AppConfigProd.baseUrlOther,
  });
}

class CcAppConfigFlags {
  /// Config logger : when building an environment PROD, all values are set to false.
  static bool isEnableLogger = isUatEnv || isFreeEnv;
  static bool isEnableLoggerDio = isUatEnv || isFreeEnv;
}

class CcAppConfigLimits {
  /// Config logger : when building an environment PROD, all values are set to false.
  static const int APP_TRACKING_LOG_LENGTH = 100;
}

class CcAppHeaders {
  static const Map<String, dynamic> headersEmpty = {'mode': 'empty'};

  static const Map<String, dynamic> headersHostEs = {'mode': 'host_es'};

  static Map<String, dynamic> headersDefault = isUatEnv
      ? HeaderModel(
          accept: 'application/json',
          contextID: '',
          sessionID: null,
          contentType: 'application/json; charset=utf-8',
          authorization:
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.',
        ).toJson()
      : HeaderModel(
          accept: 'application/json',
          contextID: '',
          sessionID: null,
          contentType: 'application/json; charset=utf-8',
          authorization:
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.',
        ).toJson();
}
