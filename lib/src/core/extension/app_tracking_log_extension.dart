import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:app_config/config/app_track_log/cc_app_track_log.dart';
import 'package:app_config/extension/app_track_log_extension.dart';
import 'package:cc_library/extension/kotlin/when_expression.dart';

import '../di/inject/app_inject.dart';

/// ADD INTO APP TRACKING LOG
/// FOR TRACING
///
/// Internal App Tracking Page flow :
/// 1 - summon hive box - name 'error'
/// 2 - append error log by using `add()` method
/// 3 - show error log on UI by reading box
/// 4 - allow copy that log
/// 5 - able limit show last 100 code lines?
/// ex.
///
/// +
///
int appTrackingLogLine = 0;

extension TypeExtension<T> on T {
  T addAppTrackingLog() {
    /// check type object...
    final _item = when(
      conditions: {
        this is String: () {
          return toString();
        },
      },
      orElse: toString(),
    );

    /// add tracking log item in list
    final list = getIt<CcAppTrackLog>().initMsgIfNull();

    if (list == null) {
      return this;
    }

    /// logic : add latest tracking log
    list.insert(0, 'at line $appTrackingLogLine : $_item');
    appTrackingLogLine++;

    /// logic : limit array list length
    if (list.length > CcAppConfigLimits.APP_TRACKING_LOG_LENGTH) {
      list.removeLast();
    }

    return this;
  }
}
