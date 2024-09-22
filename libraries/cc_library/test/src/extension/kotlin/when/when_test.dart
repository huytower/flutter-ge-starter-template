import 'package:cc_library/export/kotlin_extension.dart';
import 'package:cc_library/extension/logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("description", () {
    "description :...".Log();
  });

  test("test_when", () {
    when(
      conditions: {
        true: () {
          "print : 1".Log();
        },
        true: () {
          "print : 1_1".Log();
        },
        true: () {
          "print : 2_2".Log();
        }
      },
      orElse: () {
        "else".Log();
      },
    );
  });
}
