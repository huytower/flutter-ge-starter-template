import 'package:cc_library/extension/logger.dart';

class CcCounterTimer {
  static int startTime = 0;

  static start() {
    startTime = DateTime.now().millisecondsSinceEpoch;
  }

  static end() {
    var _endTime = DateTime.now().millisecondsSinceEpoch;
    "Duration:.. ${(_endTime - startTime) / 1000}".Log();
  }
}
