library content;

import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/localization.dart';
import 'package:easy_localization/src/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

/// It MUST same as module name, otherwise, exception appeared :
/// Unhandled Exception: Unable to load asset: ...
const module_name = 'content_locale';
const path_language_directory = 'packages/$module_name/assets/translations';

/// How to use?
/// Step 3 : Define corresponding locale path if has,
/// ex. '$path_language_directory/thanh_ph/home/home_en.json',
var localeEn = [
  '$path_language_directory/thanh_ph/home/home_en.json',
  '$path_language_directory/thanh_ph/setting/setting_en.json',
];

var localeVi = [
  '$path_language_directory/thanh_ph/home/home_vi.json',
  '$path_language_directory/thanh_ph/setting/setting_vi.json',
];

/// Config. multi-language, multi-locale
/// Refs. https://stackoverflow.com/questions/68497641/flutter-test-with-easy-localization-and-big-translation-json-file
class CcLocalization {
  /// Main language files in foot folder
  static const path_language_directory_root_en = 'en';
  static const path_language_directory_root_vi = 'vi';

  static Future<Widget> configure(Widget app) async {
    var config = EasyLocalization(
      path: path_language_directory,
      supportedLocales: const [
        Locale(path_language_directory_root_en),
        Locale(path_language_directory_root_vi),
      ],
      fallbackLocale: const Locale(path_language_directory_root_vi),
      useFallbackTranslations: true,
      startLocale: const Locale(path_language_directory_root_vi),
      child: app,
    );
    return config;
  }

  // locale : 'vi' , 'en' .
  static Future setLocale(String locale) async {
    await EasyLocalization.ensureInitialized();
    Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async => rootBundle.loadString(assetsPath).then(
          (jsonStr) => jsonDecode(jsonStr),
        );

    var mergeJson = <String, dynamic>{};
    var localeCurrent = (locale == path_language_directory_root_vi) ? localeVi : localeEn;
    for (var item in localeCurrent) {
      var json = await parseJsonFromAssets(item);
      json.forEach((key, value) {
        mergeJson.addAll({key: value});
      });
    }
    Localization.load(
      Locale(locale),
      translations: Translations(mergeJson),
      fallbackTranslations: Translations(mergeJson),
    );
  }
}

String getString(String id) => tr(id);
