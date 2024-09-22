import 'package:app_config/config/app_config/api_env/app_config_base.dart';
import 'package:app_config/config/app_config/cc_app_config.dart';

class AppConfigUat extends AppConfigBase {
  @override
  bool isLogger = true;

  static const String baseUrl = 'https://CHANGE_HOST_URL.com';
  static const String baseUrlOther = 'https://CHANGE_HOST_URL.com';

  @override
  bool get isEnvDev {
    // return true;
    return false;
  }

  @override
  bool get isEnvPro {
    return false;
  }

  @override
  bool isEnableLoggerDio = CcAppConfigFlags.isEnableLogger;
}
