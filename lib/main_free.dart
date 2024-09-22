import 'dart:io';

import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:app_config/enum/environment.dart' as cc_env;

import 'main.dart' as runner;

/// FOR FREE_FAKE_API ENV. ONLY
/// when server already support UAT|PROD, skip this file
void main() async {
  CcAppConfig.environment = cc_env.Environment.FREE_FAKE_API;

  /// TRICK : set this code to avoid Bad Certificate, ex. : Bad Handshake Certificate.
  /// for UAT & PROD env. : MUST validate certificate at server
  HttpOverrides.global = MyHttpOverrides();

  runner.main();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
    /// NOT RECOMMEND due to bad security,
    /// use it for TESTING only
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
