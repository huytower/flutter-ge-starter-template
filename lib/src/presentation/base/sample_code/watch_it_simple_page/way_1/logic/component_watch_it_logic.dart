import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:cc_library/helper/device_helper.dart';
import 'package:cc_library/util/base_utils.dart';
import 'package:data/model/sample/sample_model_watch_it.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:widget/export/cc_ktx_export.dart';

import '../../../../../../core/di/inject/app_inject.dart';

/// WatchItMixin : LOGIC
/// create Logic component, mandatory includes :
/// - boolean value notifier. : to avoid build() called twice issues
/// - Model obj. notifier. : value notifier - notify data set changed
/// - Model value : include meta data, params ...
///
@lazySingleton
class ComponentWatchItLogic {
  final isReady = ValueNotifier(false);
  final appVersion = ValueNotifier('');

  SampleModelWatchItNotifier modelNotifier = getIt<SampleModelWatchItNotifier>();

  String get appInfo => '${CcAppName.appName}'
      '/${appVersion.value}'
      '/is release build mode = ${!kDebugMode}';

  Future<String> getAppVersion() async => await BaseUtils.getAppVersion();

  Future<void> getDeviceInfo() async {
    try {
      appVersion.value = await getAppVersion();

      /// WatchItMixin : Step 3 : assign new data, then trigger|notify data set changed
      SampleModelOri model = SampleModelOri(deviceInfo: await DeviceHelper.getDeviceInfo());

      modelNotifier.model = model;
    } catch (e) {
      'e = $e'.Log();
    }
  }
}
