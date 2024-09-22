import 'package:app_config/config/app_config/api_env/app_config_base.dart';
import 'package:app_config/config/app_config/cc_app_config.dart';

class AppConfigFree extends AppConfigBase {
  @override
  bool isLogger = true;

  static const String baseUrl = 'https://mockland.dev/';
  static const String baseUrlOther = 'https://mockland.dev/';

  @override
  bool get isEnvDev {
    return false;
  }

  @override
  bool get isEnvPro {
    return false;
  }

  @override
  bool isEnableLoggerDio = CcAppConfigFlags.isEnableLogger;
}
