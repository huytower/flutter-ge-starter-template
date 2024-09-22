import 'package:app_config/di/inject/app_config_inject.dart';
import 'package:cc_library/extension/logger.dart';

import '../config/app_track_log/cc_app_track_log.dart';

extension AppTrackLogExtension on CcAppTrackLog {
  List<String>? initMsgIfNull() {
    var list = getItAppConfig<CcAppTrackLog>().msg;
    try {
      if (list == null) {
        list = [];
      }
    } catch (e) {
      'AppTrackLogExtension : e'.Log();
    }

    getItAppConfig<CcAppTrackLog>().msg = list;

    return list;
  }
}
