import 'dart:ui';

import 'package:cc_library/constant/cc_padding_params.dart';
import 'package:cc_library/export/kotlin_extension.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/dialog/action_btn_in_dialog.dart';
import 'package:cc_library/widget/flex/cc_column_start.dart';
import 'package:cc_library/widget/flex/cc_row_between.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Popular widgets :
/// Basic dialog is shown on UI
/// ex.
/// DialogUtils.showDialogConfirm(BaseDialog(desc: 'ABC\nABC', ));
class BaseDialog extends StatelessWidget {
  const BaseDialog({
    Key? key,
    this.onTapCancel,
    this.onTapConfirm,
    this.agreeText,
    this.bgColor,
    this.cancelText,
    this.cancelTextColor,
    this.confirmTextColor,
    required this.desc,
    this.descTextColor,
    this.dividerColor,
    this.isActionBtnVisible = true,
    this.isCancelBtnShown = false,
    this.maxLines = 3,
    this.status = DialogStatus.ERROR,
  }) : super(key: key);

  final VoidCallback? onTapCancel, onTapConfirm;

  final bool isActionBtnVisible, isCancelBtnShown;

  final int maxLines;

  final Color? bgColor, descTextColor;
  final Color? cancelTextColor, confirmTextColor, dividerColor;

  final DialogStatus? status;

  final String? agreeText, cancelText, desc;

  @override
  Widget build(BuildContext context) => buildDialogWidget();

  Widget buildActionButtonsWidget() => ActionBtnInDialog(
        onTapCancel: onTapCancel,
        onTapConfirm: onTapConfirm,
        isCancelBtnShown: isCancelBtnShown,
        agreeText: agreeText,
        cancelText: cancelText,
        cancelTextColor: cancelTextColor,
        confirmTextColor: confirmTextColor,
        dividerColor: dividerColor,
      );

  Widget buildDialogBodyWidget() => CcColStart(
        children: [
          /// dialog description
          buildDesc(),

          /// action buttons
          isActionBtnVisible ? buildActionButtonsWidget() : const SizedBox(),
        ],
      );

  Widget buildDesc() => Expanded(
        child: CcRowBetween(
          children: [
            const CcSpaceLarge(),
            const CcSpaceLarge(),

            /// Icon : show alert icon : Error, Warning, Success mark
            buildIconAlert(),

            const CcSpaceLarge(),

            /// Text
            Expanded(
              child: CcText(
                desc,
                align: Alignment.centerLeft,
                color: descTextColor ?? BaseColors.black_50,
                fontSize: 13.0,
                heightLine: 1.2,
                maxLines: maxLines,
                marginLeft: CcPaddingParams.PAGE_MID,
                marginRight: CcPaddingParams.PAGE_MID,
                textAlign: TextAlign.start,
              ),
            ),

            const CcSpaceSmall(),
          ],
        ),
      );

  Widget buildDialogWidget() => Dialog(
        /// border padding at screen left & screen right
        insetPadding: EdgeInsets.only(bottom: 27.0, left: 15.0, right: 15.0, top: 15.0),

        /// MUST set transparent bgColor to able avoid around white padding space
        backgroundColor: Colors.transparent,

        /// padding width of dialog
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),

            /// Logic : get corresponding dialog : include Blur effect + transparent effect
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(
                    width: Get.width,
                    height: isActionBtnVisible ? 145 : 75,
                    decoration: BoxDecoration(
                      color: bgColor ?? BaseColors.white_80,
                    ),
                    child: buildDialogBodyWidget()))),
      );

  Widget buildIconAlert() => when(variable: status, conditions: {
        DialogStatus.ERROR: () => Icon(
              Icons.error_outline,
              size: 24,
              color: Colors.redAccent,
            ),
        DialogStatus.INFO: () => Icon(
              Icons.announcement_outlined,
              size: 24,
              color: Colors.grey,
            ),
        DialogStatus.SUCCESS: () => Icon(
              Icons.check_circle,
              size: 24,
              color: Colors.green,
            ),
        DialogStatus.WARNING: () => Icon(
              Icons.warning_outlined,
              size: 24,
              color: Colors.yellow,
            ),
      });
}

enum DialogStatus { ERROR, INFO, SUCCESS, WARNING }
