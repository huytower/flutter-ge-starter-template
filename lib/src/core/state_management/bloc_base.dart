
import 'package:app_config/config/app_config/cc_app_config.dart';

import '../di/inject/app_inject.dart';

class BlocBase {
  var ccNativeApp = getIt<CcAppConfig>();

  //String? accessToken;
  BlocBase() {
    //accessToken = ccNativeApp.accessToken;
  }

  void dispose() {}
}
