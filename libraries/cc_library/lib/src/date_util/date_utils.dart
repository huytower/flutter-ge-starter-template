//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

///
///
///
///
class DateUtils {
  static const String YYYY_MM_DD = "yyy-MM-DD";
  static const String DD_MM_YYYY = "DD-MM-yyy";
  static const String MM_DD_YYY_HH_MM_A = "hh:mm a, dd/MM/yyyy";
  static const String YYY_MM_DD_T_HH_MM_SSZ = "yyyy-MM-dd'T'HH:mm:ss.ssssssZ";
  static const String YYY_MM_DD_T_HH_MM_SS = "yyyy-MM-dd'T'HH:mm:ss";
  static const String DEFAULT_FORMAT_DATE = YYY_MM_DD_T_HH_MM_SS;

  @deprecated
  static String getDateFormat({
    int? milliseconds,
    String pattern = DEFAULT_FORMAT_DATE,
  }) {
    // int _milliseconds;
    // if (milliseconds == null) {
    //   DateTime currentPhoneDate = DateTime.now(); //DateTime
    //   //Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp
    //   //_milliseconds = myTimeStamp.millisecondsSinceEpoch;
    // } else {
    //   _milliseconds = milliseconds;
    // }
    // var timestamp = DateTime.fromMillisecondsSinceEpoch(_milliseconds);
    // var dateFormat = DateFormat(pattern).format(timestamp);

    return "";
  }

  static String now({String format = DEFAULT_FORMAT_DATE}) {
    var now = DateTime.now().millisecondsSinceEpoch;
    var timestamp = DateTime.fromMillisecondsSinceEpoch(now);
    var dateFormat = DateFormat(format).format(timestamp);
    return dateFormat;
  }

  static String changeDateFormat(
    String date, {
    String formatInput = DEFAULT_FORMAT_DATE,
    String formatOutput = DEFAULT_FORMAT_DATE,
  }) {
    var _date = DateFormat(DEFAULT_FORMAT_DATE).parse(date);
    return getDateFormat(
      milliseconds: _date.millisecondsSinceEpoch,
      pattern: formatOutput,
    );
  }
}
