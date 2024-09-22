import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class KeyBoardUtil {
  static void showKeyboard() {}

  /// Logic : hide keyboard in two ways
  static void hideKeyboard({BuildContext? context}) {
    if (context == null) {
      Get.focusScope?.unfocus();
    } else {
      var currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
  }
}
