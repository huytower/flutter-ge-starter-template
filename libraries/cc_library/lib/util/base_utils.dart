import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:android_id/android_id.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/src/transformers/backpressure/throttle.dart';

import '../constant/cc_log_tags.dart';
import '../extension/logger.dart';
import '../src/gson/src/values.dart';

class BaseUtils {
  static void copyToClipboard(String s) => Clipboard.setData(ClipboardData(text: s));

  static String generateMd5(String input) => md5.convert(utf8.encode(input)).toString();

  static Future<String> getAppVersion() async {
    var packageInfo = await PackageInfo.fromPlatform();

    if (Platform.isAndroid || Platform.isIOS) {
      return '${packageInfo.version}(code : ${packageInfo.buildNumber})';
    }

    return 'unknown';
  }

  static Map<String, dynamic> getDecodedToken(String t) => JwtDecoder.decode(t);

  /// Timer converter : input = duration, output = date time string
  static String convertDurationToTimeString(Duration d) {
    var h = '', m = d.inMinutes.remainder(60).toString(), s = d.inSeconds.remainder(60).toString();

    if (d.inHours != 0) {
      h = d.inHours.toString();
    }

    return h.isNotEmpty ? ('$h:$m:$s') : ('$m:$s');
  }

  /// Timer converter : input = date time string, output = duration
  static Duration convertTimeStringToDuration(String s) {
    var hours = 0, minutes = 0, micros;
    var parts = s.split(':');

    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  /// get Device Capacity
  /// ex. 1 GB, 100 MB .v.v
  static String getFormatCapacity(int number) {
    String s;

    if (number.toString().length > 9) {
      s = '${getFormatListenViewCounter().format(number).substring(0, 2)} Gb';
    } else if (number.toString().length > 6) {
      s = '${getFormatListenViewCounter().format(number).substring(0, 2)} Mb';
    } else if (number.toString().length > 3) {
      s = '${getFormatListenViewCounter().format(number).substring(0, 2)} Kb';
    } else {
      s = '${getFormatListenViewCounter().format(number).substring(0, 2)} byte';
    }

    return s;
  }

  /// ex. "1,000,0000", "1,000,0000 views" ...
  static NumberFormat getFormatListenViewCounter() => NumberFormat('###,###,###,###.##', 'en_US');

  /// ex. "090 0000 0000"
  static NumberFormat getFormatPhoneNumber() => NumberFormat('### #### ####', 'en_US');

  /// Logic : show correct VN locale format
  static RxList<String> getFormatIAPPackagePricesAtLocaleVN(
    RxList<String> defaultPrices,
  ) {
    var vnLocalePrice = <String>[].obs;

    for (var item in defaultPrices) {
      if (BaseUtils.isLocaleVN() && item.contains('000')) {
        /// Logic : only convert to this format for VN locale
        /// For iOs platform
        if (Platform.isIOS || Platform.isMacOS) {
          vnLocalePrice.add(item.substring(1, item.length).replaceAll('000', 'k'));
        } else if (Platform.isAndroid) {
          /// For Android platform
          vnLocalePrice.add(item.substring(0, item.length - 1).replaceAll('.000', 'k'));
        }
      } else {
        /// For the other regions, locales
        vnLocalePrice.add(item);
      }
    }

    return vnLocalePrice;
  }

  /// get UTC time
  static DateTime getUTCLocal({required DateTime dtm, String pattern = ''}) => dtm.add(Duration.zero);

  /// get UTC time in timestamp
  static int getUtcNowInTimeStamp() => DateTime.now().microsecondsSinceEpoch;

  /// Check if var is boolean
  static bool isBooleanValue(var s) {
    if (s is String) {
      return s.toLowerCase() == 'true' || s.toLowerCase() == '1b';
    } else if (s is Byte) {
      return s.value == 1;
    } else {
      return s;
    }
  }

  static bool isNullOrEmpty(String str) {
    return ['', 'null', '{}', null, false, 0].contains(str);
  }

  /// Localization = VN
  static bool isLocaleVN() => Platform.localeName.contains('VN');

  // ip 5, device 4.95 inch, smallest width screen devices
  /// MIGHT BE USE 400.0
  static bool isSmallerThan5InchDeviceType() => Get.width < 390.0;

  // ip 11 pro, 11 mini = 375.0
  // ip 11 pro max = 414.0
  static bool isProMaxDeviceType() => Get.width >= 400.0 && Get.mediaQuery.padding.bottom > 20.0;

  /// Feature : prevent many clicks in one time
  /// Params :
  /// - final Rx<Timer> timer = Timer(Duration.zero, () {}).obs;
  /// - function : functionality method, ex. : () => function
  /// NOTICE : if not use in `GetXController`, make sure timer is disposed when destroyed
  static void preventClickSoFast(timer, Function function) {
    if (timer.value != null && timer.value.isActive) {
      timer.value.cancelTimer();
      timer.value = null;
    }

    timer.value = Timer(const Duration(milliseconds: 700), () => function());
  }

  /// Generates a positive random integer uniformly distributed on the range
  /// from [min], inclusive, to [max], exclusive.
  double randomInRange(int min, int max) => (min + Random().nextInt(max - min)).toDouble();

  static Future throttleTime(Future<void> Function() function) async {
    return Stream.fromIterable([function]).throttleTime(const Duration(seconds: 2)).listen((event) {
      // print('event = $event');

      event.call();
    });
  }

  static String upperCaseFirst({String pattern = ''}) =>
      pattern.isEmpty ? '' : pattern[0].toUpperCase() + pattern.substring(1);
}
