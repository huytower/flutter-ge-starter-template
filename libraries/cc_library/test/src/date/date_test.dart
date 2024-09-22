import 'package:cc_library/src/date_util/date_utils.dart';
import 'package:cc_library/extension/logger.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("date_utils", () {
    //var now = DateUtils.now(format: DateUtils.DD_MM_YYYY);

    String date = DateUtils.getDateFormat();
    "date_utils:..  ${date} ".Log();

    String data_2 = DateUtils.changeDateFormat(
      date,
      formatInput: DateUtils.YYY_MM_DD_T_HH_MM_SS,
      formatOutput: DateUtils.YYYY_MM_DD,
    );

    "data_2 :... ${data_2} ".Log();
  });
}
