import 'package:app_config/config/app_config/api_env/app_config_prod.dart';
import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:app_config/constant/cc_constants.dart';
import 'package:data/helper/data_helper.dart';

class LoggerHelper {
  static void printCustom(dynamic str) {
    if (CcAppConfig.instance is AppConfigProd) {
      return;
    }
    if (str is String) {
      var dtm = DateTime.now();
      print("$str ${DataHelper.convertDatetimeToString(
        dtm: dtm,
        pattern: CcConstantsDateTime.datetimeFormatPattern2Encode,
      )} ${dtm.millisecond} ${dtm.microsecond}");
    }
  }
}
