import 'package:app_config/config/app_config/api_env/app_config_prod.dart';

class AppConfigBase {
  /// MUST INCREASE VERSION FOR RELEASE
  int versionIOS = 1;
  int versionAndroid = 1;

  int versionApi = 0;

  bool isLogger = false;
  bool isEnableLoggerDio = false;

  static const String baseUrl = "";

  /// todo(huy): NOTICE CLEAN
  bool get isEnvDev {
    return false;
  }

  bool get isEnvPro {
    return this is AppConfigProd;
  }
}
