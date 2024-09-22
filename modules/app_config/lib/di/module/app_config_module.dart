import 'package:app_config/config/app_storage/cc_app_storage.dart';
import 'package:app_config/config/device_info/cc_device_info.dart';
import 'package:app_config/config/app_track_log/cc_app_track_log.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppConfigModule {
  @lazySingleton
  CcAppStorage get ccAppStorage => CcAppStorage.instance;

  @lazySingleton
  CcDeviceInfo get ccDeviceInfo => CcDeviceInfo.instance;

  @lazySingleton
  CcAppTrackLog get ccAppTrackLog => CcAppTrackLog.instance;
}
