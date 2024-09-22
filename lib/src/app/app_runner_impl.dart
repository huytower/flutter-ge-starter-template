import 'package:app_config/box/cc_hive_box.dart';
import 'package:app_config/config/device_info/cc_device_info.dart';
import 'package:cc_library/helper/device_helper.dart';
import 'package:cc_library/util/base_utils.dart';
import 'package:hive/hive.dart';

import '../core/di/inject/app_inject.dart';

mixin AppRunnerImpl {
  void onDispose() {
    // dispose hive box.
    Hive.box(CcHiveBox.application_box_name).close();
    Hive.box(CcHiveBox.device_info_box_name).close();
    Hive.box(CcHiveBox.app_track_log_box_name).close();
    //dispose.
  }

  Future onInitState() async {
    getIt<CcDeviceInfo>()..deviceId = await DeviceHelper.getDeviceId()
    ..appVersion = await BaseUtils.getAppVersion();
  }
}
