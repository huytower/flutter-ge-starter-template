import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:app_config/enum/environment.dart' as cc_env;

import 'main.dart' as runner;

void main() async {
  CcAppConfig.environment = cc_env.Environment.UAT;

  runner.main();
}
