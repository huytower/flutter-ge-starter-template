import 'package:app_config/config/app_storage/cc_app_storage.dart';
import 'package:app_config/config/device_info/cc_device_info.dart';
import 'package:app_config/config/app_track_log/cc_app_track_log.dart';

Future registerHiveAdapter() async {
  await CcAppStorage.register();
  await CcDeviceInfo.register();
  await CcAppTrackLog.register();
}
