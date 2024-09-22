import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtils {
  static void showSnackBarAutoDismiss({
    String desc = '',
    Color? textColor,
    Duration? duration,
    VoidCallback? onTap,
  }) =>
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text(desc, style: WidgetHelper.getTextStyleRoboto(fontSize: 16, heightLine: 1.2)),
        backgroundColor: textColor ?? BaseColors.pink_90,
        duration: duration ?? const Duration(milliseconds: 1300),
      ));
}
