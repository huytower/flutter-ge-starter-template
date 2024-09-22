import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:app_config/constant/cc_constants.dart';
import 'package:intl/intl.dart';
import 'package:reusable/helper/logger_helper.dart';

//v1.1
class DataHelper {
  static final DataHelper instance = DataHelper._internal();

  factory DataHelper() {
    return instance;
  }

  static int seconds = 1;
  static int minute = 60 * seconds;
  static int hour = 60 * minute;
  static int day = 24 * hour;
  static int month = 30 * day;

  DataHelper._internal();

  static int addDate = 0;
  static int subDate = 1;
  static int startDate = 2;
  static int endDate = 3;

  static defaultZezo(value) {
    if (value < 0) return 0;
    return value;
  }

  static defaultZezoDouble(value) {
    if (value <= 0) return 0.0;
    return value;
  }

  Future<dynamic> waitConditional(Function isTrue) async {
    var promise = Completer();
    Future.delayed(const Duration(milliseconds: 100), () async {
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (isTrue()) {
          timer.cancel();
          promise.complete();
        }
        LoggerHelper.printCustom("wait master data state exist");
      });
    });
    return promise.future;
  }

  static int randomNumber() {
    var rng = new Random();
    return rng.nextInt(100);
  }

  static DateTime setDateTime(
      {DateTime? dtm,
      int? type,
      int? year,
      int? month,
      int? day,
      int? hour,
      int? minute,
      int? second,
      int? millisecond,
      int? microsecond}) {
    int _year = year != null ? year : dtm!.year;
    int _month = month != null ? month : dtm!.month;
    int _day = day != null ? day : dtm!.day;
    int _hour = hour != null ? hour : dtm!.hour;
    int _minute = minute != null ? minute : dtm!.minute;
    int _second = second != null ? second : dtm!.second;
    int _millisecond = millisecond != null ? millisecond : dtm!.millisecond;
    int _microsecond = microsecond != null ? microsecond : dtm!.microsecond;
    if (type == DataHelper.addDate) {
      _year = year == null ? dtm!.year : dtm!.year + year;
      _month = month == null ? dtm.month : dtm.month + month;
      _day = day == null ? dtm.day : dtm.day + day;
      _hour = hour == null ? dtm.hour : dtm.hour + hour;
      _minute = minute == null ? dtm.minute : dtm.minute + minute;
      _second = second == null ? dtm.second : dtm.second + second;
      _millisecond = millisecond == null ? dtm.millisecond : dtm.millisecond + millisecond;
      _microsecond = microsecond == null ? dtm.microsecond : dtm.microsecond + microsecond;
    }
    if (type == DataHelper.subDate) {
      _year = year == null ? dtm!.year : dtm!.year - year;
      _month = month == null ? dtm.month : dtm.month - month;
      _day = day == null ? dtm.day : dtm.day - day;
      _hour = hour == null ? dtm.hour : dtm.hour - hour;
      _minute = minute == null ? dtm.minute : dtm.minute - minute;
      _second = second == null ? dtm.second : dtm.second - second;
      _millisecond = millisecond == null ? dtm.millisecond : dtm.millisecond - millisecond;
      _microsecond = microsecond == null ? dtm.microsecond : dtm.microsecond - microsecond;
    }
    if (type == DataHelper.startDate) {
      _hour = 0;
      _minute = 0;
      _second = 0;
      _microsecond = 0;
      _millisecond = 0;
    }
    if (type == DataHelper.endDate) {
      _hour = 23;
      _minute = 59;
      _second = 59;
      _microsecond = 59;
      _millisecond = 59;
    }
    return new DateTime(_year, _month, _day, _hour, _minute, _second, _millisecond, _microsecond);
  }

  static String getDelayTime(DateTime date1) {
    var ts = DateTime.now().difference(date1);
    int delta = ts.inSeconds;
    if (delta <= 0) {
      return "";
    }
    delta = delta.abs();
    if (delta < 2 * minute) return "1 phút";

    if (delta < 45 * minute) return ts.inMinutes.toString() + " phút";

    if (delta < 24 * hour) return (ts.inHours <= 0 ? 1 : ts.inHours).toString() + " giờ";

    if (delta < 48 * hour) return "${ts.inDays} ngày";

    return "${ts.inDays} ngày";
    // return date1.ctmToString(pattern: Constants.datetimeStyle1FormatPattern);
  }

  static bool validateStringDate(String str, String pattern) {
    try {
      var data = DateFormat(pattern).parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  static DateTime getLocalUTC({required DateTime dtm, String pattern = ""}) {
    return dtm.add(new Duration(hours: 0));
  }

  static bool isArrayNullOrEmpty(lst) {
    if (lst == null || lst.length == 0) {
      return true;
    }
    return false;
  }

  static List<String> split(String str, String pattern) {
    if (isNullOrEmpty(str)) {
      return [];
    }
    return str.split(pattern).toList();
  }

  static bool isStringArray(String data) {
    if (DataHelper.isNullOrEmpty(data)) {
      return false;
    }
    // ignore: unrelated_type_equality_checks
    return data.lastIndexOf(']') == data.substring(data.length - 1, data.length);
  }

  static T? firstOrDefault<T>(lst) {
    if (isArrayNullOrEmpty(lst)) {
      return null;
    }
    return lst.first;
  }

  static T? firstWhere<T>(lst, Function isTrue) {
    if (isArrayNullOrEmpty(lst)) {
      return null;
    }
    if (lst is List) {
      var rs = lst.firstWhereOrNull((x) {
        return isTrue(x);
      });
      return rs;
    }
    return null;
  }

  static List<T?> pluck<T>(lst, Function getValue) {
    if (isArrayNullOrEmpty(lst)) {
      return [];
    }
    List<T?> arr = [];
    for (var item in lst) {
      arr.add(getValue(item));
    }
    return arr;
  }

  static bool any(lst, Function isTrue) {
    if (isArrayNullOrEmpty(lst)) {
      return false;
    }
    if (lst is List) {
      var rs = lst.firstWhereOrNull((x) {
        return isTrue(x);
      });
      return rs != null;
    }
    return false;
  }

  static dynamic sum(lst, Function getValue) {
    if (isArrayNullOrEmpty(lst)) {
      return 0;
    }
    if (lst is List) {
      var rs = lst
          .map((m) {
            return getValue(m);
          })
          .toList()
          .fold(0, (dynamic temp, f) => temp + f);
      return rs;
    }
    return 0;
  }

  static bool isNullOrEmpty(String? str) {
    return ["", "null", "{}", null, false, 0].contains(str);
  }

  static String? getStringNullOrEmpty(String? str, {String? valueDefault}) {
    if (isNullOrEmpty(str)) {
      return valueDefault;
    }
    return str;
  }

  static String formatDatetime2Encode(DateTime? date, {String? pattern}) {
    return DataHelper.convertDatetimeToString(
        dtm: date, pattern: pattern ?? CcConstantsDateTime.datetimeFormatPattern2Encode);
  }

  static String formatDatetimeJson(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return new DateFormat(CcConstantsDateTime.datetimeFormatPattern).format(getLocalUTC(dtm: todayDate));
  }

  static bool compareDate(DateTime date1, String operation, DateTime date2, {String? type}) {
    int? subTime = 0;
    if (type == "date") {
      subTime = date1.difference(date2).inDays;
    } else {
      subTime = date1.difference(date2).inMicroseconds;
    }
    bool result = false;
    if (operation == "=") {
      if (subTime == 0) result = true;
    } else if (operation == "<=") {
      if (subTime == 0 || subTime < 0) result = true;
    } else if (operation == ">") {
      if (subTime > 0) result = true;
    }
    return result;
  }

  static DateTime? convertDatetimeJson(String? strDate, {bool isCheckJsonNet = false}) {
    if (isNullOrEmpty(strDate)) {
      return null;
    }
    if (isCheckJsonNet) {
      if (strDate!.contains("/Date")) {
        return convertDatetimeJsonNet(strDate);
      }
    }

    strDate = strDate!.replaceAll("+07:00", "");
    return DateTime.parse(strDate);
//    DateTime temp = DateTime.parse(strDate);
//    DateTime todayDate = UtilHelper.setDateTime(dtm: temp, hour: temp.hour + 7);
//    return todayDate;
  }

  static DateTime? convertDatetimeJsonNet(String? strDate) {
    if (isNullOrEmpty(strDate)) {
      return null;
    }
    strDate = strDate!.replaceAll("/Date(", "");
    strDate = strDate.replaceAll(")/", "");
    DateTime temp = DateTime.fromMillisecondsSinceEpoch(int.parse(strDate), isUtc: true);
    DateTime temp2 = DataHelper.setDateTime(dtm: temp, hour: temp.hour + 7);
    return temp2;
  }

  static String convertDatetimeToString({DateTime? dtm, String pattern = ""}) {
    try {
      if (dtm == null) {
        return "";
      }
      if (DataHelper.isNullOrEmpty(pattern)) {
        pattern = CcConstantsDateTime.datetimeFormatPattern;
      }
      return new DateFormat(pattern).format(getLocalUTC(dtm: dtm));
    } catch (e) {
      print(e);
    }
    return "";
  }

  static String upperCaseFirst({String pattern = ""}) {
    return pattern.length < 1 ? '' : pattern[0].toUpperCase() + pattern.substring(1);
  }

  static String lowerCaseFirst({String? pattern}) {
    pattern = pattern ?? '';
    return pattern.length < 1 ? '' : pattern[0].toLowerCase() + pattern.substring(1);
  }

  static String getCaseFirst({String? pattern}) {
    pattern = pattern ?? '';
    return pattern.length < 1 ? pattern : pattern[0];
  }

  static String substringCaseFirst({String? pattern}) {
    pattern = pattern ?? '';
    return pattern.length < 1 ? pattern : pattern.substring(1);
  }

  static String truncatedText({required String str, required int truncateAt}) {
    String elepsis = "..."; //define your variable truncation elipsis here
    String truncated = "";

    if (str.length > truncateAt) {
      truncated = str.substring(0, truncateAt - elepsis.length) + elepsis;
    } else {
      truncated = str;
    }
    return truncated;
  }

//  static String timeagoformat({DateTime dtm, String pattern = ""}) {
//    if (dtm == null) {
//      return "";
//    }
//    //Duration(days: dtm.day, hours: dtm.hour, minutes: dtm.minute,
//    //        seconds: dtm.second, milliseconds: dtm.millisecond, microseconds: dtm.microsecond)
//    dtm = getLocalUTC(dtm: dtm);
//    Duration dur = new DateTime.now().difference(dtm);
//    final fifteenAgo = new DateTime.now().subtract(dur);
//
//    return timeago.format(fifteenAgo);
//  }
  static double getValueMoneyformatVND({
    required String value,
    String symbol = "",
    int toFixDecimal = 0,
  }) {
    value = value.replaceAll('.', '');
    value = value.replaceAll(',', '.');
    value = value.replaceAll('đ', '');
    return double.parse(value);
  }

  static String moneyformatVND({
    double? money,
    String symbol = "",
    int toFixDecimal = 0,
    defaultValue = "",
  }) {
    String strMoney = "0";
    if (money == null || money == 0) {
      return defaultValue;
    }
    double floor = money - money.floor();
    if (floor == 0.0) {
      toFixDecimal = 0;
    }
    String strNumberFormat = "#,###";
    if (toFixDecimal > 0) {
      String strToFixDecimal = "";
      for (int i = 0; i < toFixDecimal; i++) {
        strToFixDecimal = strToFixDecimal + "#";
      }
      strNumberFormat = strNumberFormat + "." + strToFixDecimal;
    }
    final f = NumberFormat(strNumberFormat, "en-US");
    strMoney = f.format(money);

    strMoney = strMoney.replaceAll(',', '@');
    strMoney = strMoney.replaceAll('.', ',');
    strMoney = strMoney.replaceAll('@', '.');

    return strMoney + symbol;
  }

  static String? moneyformatEN({
    double? money,
    String symbol = "",
    int toFixDecimal = 0,
    defaultValue = "0",
  }) {
    String strMoney = "0";
    if (money == null || money == 0) {
      return defaultValue + symbol;
    }
    double floor = money - money.floor();
    if (floor == 0.0) {
      toFixDecimal = 0;
    }
    String strNumberFormat = "#,###";
    if (toFixDecimal > 0) {
      String strToFixDecimal = "";
      for (int i = 0; i < toFixDecimal; i++) {
        strToFixDecimal = strToFixDecimal + "#";
      }
      strNumberFormat = strNumberFormat + "." + strToFixDecimal;
    }
    final f = new NumberFormat(strNumberFormat);
    strMoney = f.format(money);

    // strMoney = strMoney.replaceAll(',', '@');
    // strMoney = strMoney.replaceAll('.', ',');
    // strMoney = strMoney.replaceAll('@', '.');

    return strMoney + symbol;
  }

  //thằng này khác là nếu value = 0 thì return 0 + symbol
  static String? moneyformat({
    double? money,
    String symbol = "",
    int toFixDecimal = 0,
    defaultValue = "0",
  }) {
    String strMoney = "0";
    if (money == null || money == 0) {
      return defaultValue + symbol;
    }
    double floor = money - money.floor();
    if (floor == 0.0) {
      toFixDecimal = 0;
    }
    String strNumberFormat = "#,###";
    if (toFixDecimal > 0) {
      String strToFixDecimal = "";
      for (int i = 0; i < toFixDecimal; i++) {
        strToFixDecimal = strToFixDecimal + "#";
      }
      strNumberFormat = strNumberFormat + "." + strToFixDecimal;
    }
    final f = NumberFormat(strNumberFormat, 'en_US');
    strMoney = f.format(money);

    strMoney = strMoney.replaceAll(',', '@');
    strMoney = strMoney.replaceAll('.', ',');
    strMoney = strMoney.replaceAll('@', '.');

    return strMoney + symbol;
  }

  static String? moneyformatChart({required double money, int toFixDecimal = 2}) {
    String symbol = "";
//    if (money >= 1000000000) {
//      money = money / 1000000000;
//      symbol = "B";
//      toFixDecimal = 2;
//    }
//    if (money >= 1000000) {
//      money = money / 1000000;
//      symbol = "M";
//      toFixDecimal = 2;
//    }
    money = money / 1000000;
    String? strMoney = moneyformat(money: money, symbol: symbol, toFixDecimal: toFixDecimal);
    return strMoney;
  }

  static String? moneyformatSymbol({required double money, int toFixDecimal = 2}) {
    String symbol = "";
    if (money >= 1000000000) {
      money = money / 1000000000;
      symbol = "B";
      toFixDecimal = 2;
    }
    if (money >= 1000000) {
      money = money / 1000000;
      symbol = "M";
      toFixDecimal = 2;
    }
    money = money / 1000000;
    String? strMoney = moneyformat(money: money, symbol: symbol, toFixDecimal: toFixDecimal);
    return strMoney;
  }

  static dynamic GetSaleValue(lst) {
    if (isArrayNullOrEmpty(lst)) {
      return [];
    }
    return lst;
  }

//  static String RemoveUnicode(String str) {
//    str.re
//    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
//    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
//    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
//    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
//    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
//    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
//    str = str.replace(/đ/g, "d");
//    return str;
//  }

  static bool IsStringContain(String? strRoot, String strRequest, {bool? IsSearchWithFormat}) {
    if (isNullOrEmpty(strRoot)) {
      return false;
    }
    if (isNullOrEmpty(strRequest)) {
      return true;
    }
//    strRoot = strRoot.normalize();
//    strRequest = strRequest.normalize();
    strRoot = strRoot!.toLowerCase();
    strRequest = strRequest.toLowerCase();

//  if (IsSearchWithFormat) {
//    strRoot = UtilJS.String.RemoveUnicode(strRoot);
//    strRequest = UtilJS.String.RemoveUnicode(strRequest);
//  }

    if (strRoot.indexOf(strRequest) < 0) {
      return false;
    }
    return true;
  }

  static dynamic prop(
    Map res,
    String propName,
  ) {
    if (res != null && res[propName] != null) {
      return res[propName];
    }
    return null;
  }
}
