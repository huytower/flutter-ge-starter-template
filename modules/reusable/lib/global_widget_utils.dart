import 'package:cc_library/util/dialog_utils.dart';
import 'package:cc_library/widget/dialog/base_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// POPULAR UTILS
/// include most popular|re-use methods|functions,
/// calling as global methods|functions

Future showDialogConfirm({
  VoidCallback? onTapCancel,
  VoidCallback? onTapConfirm,
  Color? bgColor,
  Color? bgColorBarrier,
  String? agreeText,
  String? cancelText,
  Color? confirmTextColor,
  required String desc,
  Color? descTextColor,
  bool isActionBtnVisible = true,
  bool? isAllowDismiss = true,
  bool? isAutoDismiss = false,
  bool isCancelBtnShown = false,
  DialogStatus? status = DialogStatus.ERROR,
}) async =>
    0.5.delay(() => DialogUtils.showDialogConfirm(
        BaseDialog(
          onTapCancel: onTapCancel,
          onTapConfirm: onTapConfirm,
          agreeText: agreeText,
          bgColor: bgColor,
          cancelText: cancelText,
          confirmTextColor: confirmTextColor,
          desc: desc,
          descTextColor: descTextColor,
          isCancelBtnShown: isCancelBtnShown,
          isActionBtnVisible: isActionBtnVisible,
          status: status,
        ),
        isAllowDismiss: isAllowDismiss,
        isAutoDismiss: isAutoDismiss,
        bgColorBarrier: bgColorBarrier));
