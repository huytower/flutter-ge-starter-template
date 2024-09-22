import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constant/cc_log_tags.dart';
import '../extension/logger.dart';

class DeviceHelper{

  static Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS || Platform.isMacOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor ?? ''; // unique ID on iOS
    } else {
      final String androidId = await getDeviceAndroidId();

      // if (Platform.isAndroid || Platform.isLinux) {
      // var androidDeviceInfo = await deviceInfo.androidInfo;
      // return androidDeviceInfo.androidId ?? ''; // unique ID on Android
      return androidId; // unique ID on Android
    }
  }

  static Future<String> getDeviceAndroidId() async {
    const _androidIdPlugin = AndroidId();
    final String? androidId = await _androidIdPlugin.getId();

    return androidId ?? '';
  }

  static Future<String> getDeviceInfo() async {
    var deviceInfo = DeviceInfoPlugin();

    var uri = '';
    var osName = '';

    var packageInfo = await PackageInfo.fromPlatform();

    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      final String androidId = await getDeviceAndroidId();

      osName = 'ANDROID';

      uri =
      '${'${'{\"DeviceName\":\"${androidInfo.device}\",\"DeviceID\":\"$androidId\",\"OsName\":\"$osName\",\"OsVersion\":\"${androidInfo.bootloader}\",\"AppName\":\"${packageInfo.appName}'}\",\"AppVersion\":\"${packageInfo.version}'}\",\"UserName\":\"\",\"LocationInfo\":\"\",\"Adv\":\"0\"}';
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;

      osName = 'iOS';

      uri =
      '${'${'{\"DeviceName\":\"${iosInfo.name}\",\"DeviceID\":\"${iosInfo.identifierForVendor!}\",\"OsName\":\"$osName\",\"OsVersion\":\"${iosInfo.systemVersion}\",\"AppName\":\"${packageInfo.appName}'}\",\"AppVersion\":\"${packageInfo.version}'}\",\"UserName\":\"\",\"LocationInfo\":\"\",\"Adv\":\"0\"}';
    } else {
      osName = 'other';
    }

    return uri;
  }

  static Future<bool> getDeviceVersion() async {
    final deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isIOS) {
        /// check version os > ip 8 plus
        final iosInfo = await deviceInfo.iosInfo;
        final version = double.parse(iosInfo.utsname.machine.split('iPhone')[1]);
        return version > 10.5;
      } else {
        return false;
      }
    } catch (err) {
      /// simulator
      return false;
    }
  }
}