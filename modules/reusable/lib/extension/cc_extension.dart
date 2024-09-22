import 'package:collection/collection.dart';
import 'package:app_config/constant/cc_constants.dart';
import 'package:data/helper/data_helper.dart';
import 'package:intl/intl.dart';

extension S1 on String? {
  String ctmConvertNull() {
    if (this == null) {
      return '';
    }
    return this!;
  }

  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    }
    return this!.isNullOrEmpty;
  }
}

extension S on String {
  void setHello(String value) {
    print(this);
  }

  bool isNumeric() {
    if (this.isNullOrEmpty) {
      return false;
    }
    // ignore: deprecated_member_use
    return double.parse(this) != 0;
  }

  bool ctmContain(String request) {
    if (this.isNullOrEmpty && request.isNullOrEmpty) {
      return true;
    }
    String strRoot = this.toLowerCase().removeUnicode;
    String strRequest = request.toLowerCase().removeUnicode;
    if (strRoot.contains(strRequest)) {
      return true;
    }
    return false;
  }

  String get getHello {
    return this;
  }

  String get removeUnicode {
    var regex = new RegExp(r'/|à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|/g');
    String str = this.replaceAllMapped(regex, (match) => 'a');
    // if(this.contains("bằng")||this.contains("bà")){
    //   print(str);
    // }
    regex = new RegExp(r'/|è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|/g');
    str = str.replaceAllMapped(regex, (match) => 'e');

    regex = new RegExp(r'/|ì|í|ị|ỉ|ĩ|/g');
    str = str.replaceAllMapped(regex, (match) => 'i');

    regex = new RegExp(r'/|ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|/g');
    str = str.replaceAllMapped(regex, (match) => 'o');

    regex = new RegExp(r'/|ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|/g');
    str = str.replaceAllMapped(regex, (match) => 'u');

    regex = new RegExp(r'/|ỳ|ý|ỵ|ỷ|ỹ|/g');
    str = str.replaceAllMapped(regex, (match) => 'y');

    regex = new RegExp(r'/|đ|/g');
    str = str.replaceAllMapped(regex, (match) => 'd');
    return str;
  }

  bool get isNotNull {
    return this != null && this.isNotEmpty;
  }

  bool get isNullOrEmpty {
    if (!this.isNotNull) {
      return true;
    }
    return ["", "null", "{}", null, false, 0].contains(this.replaceAll(' ', ''));
  }

  String ctmConvertNull() {
    if (this.isNullOrEmpty) {
      return '';
    }
    return this;
  }

  String capitalize() {
    if (!this.isNotNull) {
      return '';
    }
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String lowerFirst() {
    if (!this.isNotNull) {
      return '';
    }
    return "${this[0].toLowerCase()}${this.substring(1)}";
  }

  String truncateWithEllipsis({required int cutoff}) {
    return (this.length <= cutoff) ? this : '${this.substring(0, cutoff)}...';
  }
}

extension I on int? {
  bool get isNotNullAndNotZezo {
    if (this == null) {
      return false;
    }
    if (this! <= 0) {
      return false;
    }
    return true;
  }

  bool get isNullOrZezo {
    if (this == null) {
      return true;
    }
    if (this! <= 0) {
      return true;
    }
    return false;
  }

  DateTime? ctmToDateTimeFromMillisecondsSinceEpoch() {
    if (this == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(this!);
  }

  bool get isNotNull {
    return this != null;
  }
}

extension DT on DateTime {
  String ctmToString({String? pattern}) {
    if (this == null) {
      return "";
    }
    if (pattern!.isNullOrEmpty) {
      pattern = CcConstantsDateTime.datetimeFormatPattern;
    }
    var rs = DateFormat(pattern).format(this.getLocalUTC());
    return rs;
  }

  int ctmGetTime() {
    return this.millisecondsSinceEpoch;
  }

  DateTime getLocalUTC({String pattern = ""}) {
    return this.add(new Duration(hours: 0));
  }

  DateTime addDay(int day) {
    return this.setDateTime(type: DataHelper.addDate, day: day);
  }

  DateTime getStartDate() {
    return this.setDateTime(type: DataHelper.startDate);
  }

  DateTime getEndDate() {
    return this.setDateTime(type: DataHelper.endDate);
  }

  DateTime setDateTime(
      {int? type,
      int? year,
      int? month,
      int? day,
      int? hour,
      int? minute,
      int? second,
      int? millisecond,
      int? microsecond}) {
    int _year = year != null ? year : this.year;
    int _month = month != null ? month : this.month;
    int _day = day != null ? day : this.day;
    int _hour = hour != null ? hour : this.hour;
    int _minute = minute != null ? minute : this.minute;
    int _second = second != null ? second : this.second;
    int _millisecond = millisecond != null ? millisecond : this.millisecond;
    int _microsecond = microsecond != null ? microsecond : this.microsecond;
    if (type == DataHelper.addDate) {
      _year = year == null ? this.year : this.year + year;
      _month = month == null ? this.month : this.month + month;
      _day = day == null ? this.day : this.day + day;
      _hour = hour == null ? this.hour : this.hour + hour;
      _minute = minute == null ? this.minute : this.minute + minute;
      _second = second == null ? this.second : this.second + second;
      _millisecond = millisecond == null ? this.millisecond : this.millisecond + millisecond;
      _microsecond = microsecond == null ? this.microsecond : this.microsecond + microsecond;
    }
    if (type == DataHelper.subDate) {
      _year = year == null ? this.year : this.year - year;
      _month = month == null ? this.month : this.month - month;
      _day = day == null ? this.day : this.day - day;
      _hour = hour == null ? this.hour : this.hour - hour;
      _minute = minute == null ? this.minute : this.minute - minute;
      _second = second == null ? this.second : this.second - second;
      _millisecond = millisecond == null ? this.millisecond : this.millisecond - millisecond;
      _microsecond = microsecond == null ? this.microsecond : this.microsecond - microsecond;
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
}

extension A on List? {
  List<T?> pluck<T>(Function f) {
    if (this.isArrayNullOrEmpty) {
      return [];
    }
    List<T?> arr = [];
    for (var item in this!) {
      arr.add(f(item));
    }
    return arr;
  }

  T? ctmGetMax<T>({f}) {
    if (this.isArrayNullOrEmpty) {
      return null;
    }
    T? max = this!.first;
    this!.forEach((x) {
      if (f(x) > f(max)) max = x;
    });
    return max;
  }

  T? ctmFirstOrDefault<T>({f}) {
    if (this.isArrayNullOrEmpty) {
      return null;
    }
    if (f is Function) {
      T? x = this?.firstWhereOrNull((x) => f(x));
      if (x == null) {
        return null;
      }
      return x;
    } else {
      return this!.first;
    }
  }

  ctmSum<T>({f, defaultValue = 0}) {
    if (this.isArrayNullOrEmpty) {
      return defaultValue;
    }
    var rs = defaultValue;
    if (f is Function) {
      for (var item in this!) {
        rs += f(item);
      }
      return rs;
    } else {
      for (var item in this!) {
        rs += item;
      }
      return rs;
    }
  }

  bool ctmAny({f}) {
    if (this.isArrayNullOrEmpty) {
      return false;
    }
    if (f is Function) {
      return this.ctmFirstOrDefault(f: (x) => f(x)) != null;
    }
    return true;
  }

  bool get isArrayNullOrEmpty {
    if (this == null || this!.length == 0) {
      return true;
    }
    return false;
  }
}

extension Dy on dynamic {
  bool get isNotNull {
    return this != null;
  }

  bool get isArrayNullOrEmpty {
    if (this == null) {
      return true;
    }
    return false;
  }
}

extension D on double? {
  bool get isNotNull {
    return this != null;
  }

  bool get isNotNullAndNotZezo {
    if (this == null) {
      return false;
    }
    if (this! <= 0) {
      return false;
    }
    return true;
  }
}

extension B on bool? {
  bool get isNotNull {
    return this != null;
  }
}

extension N on Null {
  bool get isNotNull {
    return false;
  }

  bool get isEmpty {
    return true;
  }

  bool get isArrayNullOrEmpty {
    return true;
  }

  bool get isNotNullAndNotZezo {
    return false;
  }

  String ctmConvertNull() {
    return '';
  }
}

extension M on Map? {
  ctmKeyDefault(String key) {
    if (this == null) {
      return null;
    } else if (this!.containsKey(key)) {
      return this![key];
    }
    return null;
  }
}
