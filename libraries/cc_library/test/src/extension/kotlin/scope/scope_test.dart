import 'package:cc_library/export/kotlin_extension.dart';
import 'package:cc_library/extension/logger.dart';
import 'package:flutter_test/flutter_test.dart';

class Test {
  String? value_1;
  String? value_2;

  Test({this.value_1, this.value_2});

  Map<String, dynamic> toJson() {
    return {
      'value_1': this.value_1,
      'value_2': this.value_2,
    };
  }
}

void main() {
  test("scope", () {
    var model = Test(value_1: "value_1", value_2: "value_2").apply((_this) {
      _this.value_1 = "change_value_1";
    });

    model.Log("model :...");
  });

  test("take_if", () async {
    // var list = [0, 1, 2, 3];
    // list.takeIf((it) => list.length == 4)?.apply((_this) {
    //   "_this :.. ${_this.length} ".Log();
    // });

    // Future _await = await Future.delayed(const Duration(seconds: 1));
    // "log 1:...".Log();
    // (await _await).apply((_this) {
    //   "log 3:...".Log();
    // });
    // "log 2:...".Log();

    var value = when(
        variable: 10,
        conditions: {10: "101", 10: "101_1", 11: "111", true: "true"},
        orElse: () {
          return "ko null";
        });

    "value :... ${value} ".Log();
  });
}
