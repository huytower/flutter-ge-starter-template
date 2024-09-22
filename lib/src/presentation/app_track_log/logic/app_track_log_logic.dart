import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:app_config/config/app_track_log/cc_app_track_log.dart';
import 'package:app_config/extension/app_track_log_extension.dart';
import 'package:cc_library/helper/device_helper.dart';
import 'package:cc_library/util/base_utils.dart';
import 'package:data/model/device/device_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:widget/export/cc_ktx_export.dart';

import '../../../core/di/inject/app_inject.dart';
import '../../../core/extension/app_tracking_log_extension.dart';

/// WatchItMixin : LOGIC
/// create Logic component, mandatory includes :
/// - boolean value notifier. : to avoid build() called twice issues
/// - Model obj. notifier. : value notifier - notify data set changed
/// - Model value : include meta data, params ...
///
@lazySingleton
class AppTrackLogLogic {
  final isReady = ValueNotifier(false);
  final appVersion = ValueNotifier('');

  final loggingMessages = getIt<CcAppTrackLog>().initMsgIfNull();

  DeviceModelNotifier modelNotifier = getIt<DeviceModelNotifier>();

  // TODO(huy): add fcm token, gps location, username, userid, full name, role,
  String get appInfo => '${CcAppName.appName}'
      '/${appVersion.value}'
      '/is release build mode = ${!kDebugMode}';

  Future<String> getAppVersion() async => await BaseUtils.getAppVersion();

  Future<void> getDeviceInfo() async {
    try {
      appVersion.value = await getAppVersion();

      final s = await DeviceHelper.getDeviceInfo();

      /// WatchItMixin : Step 3 : assign new data, then trigger|notify data set changed
      modelNotifier.model = DeviceModelOri(deviceInfo: s);
    } catch (e) {
      'e = $e'.Log().addAppTrackingLog();
    }
  }
}
