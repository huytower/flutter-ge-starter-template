import 'package:cc_library/constant/cc_padding_params.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/button/cc_debounce_widget.dart';
import 'package:cc_library/widget/container/container_rounded_corner_widget.dart';
import 'package:cc_library/widget/divider_line/cc_divider.dart';
import 'package:cc_library/widget/flex/cc_column_start.dart';
import 'package:cc_library/widget/flex/cc_row_center.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Action buttons, ex. : cancel, okay .v.v.
class ActionBtnInDialog extends StatelessWidget {
  ActionBtnInDialog({
    Key? key,
    this.onTapCancel,
    this.onTapConfirm,
    this.isCancelBtnShown = false,
    this.btnBgColor,
    this.agreeText,
    this.fontSize,
    this.cancelText,
    this.cancelTextColor,
    this.confirmTextColor,
    this.dividerColor,
    this.heightActionBtn,
    this.heightActionBtnBar,
  }) : super(key: key);

  /// data
  final VoidCallback? onTapCancel, onTapConfirm;

  final bool isCancelBtnShown;

  final Color? btnBgColor, cancelTextColor, confirmTextColor, dividerColor;

  final double? heightActionBtn, heightActionBtnBar, fontSize;

  final String? agreeText, cancelText;

  @override
  Widget build(BuildContext context) => getActionButtonsWidget();

  Widget getActionButtonsWidget() => SizedBox(
        height: heightActionBtnBar ?? 60,
        child: CcColStart(
          children: [
            /// line
            CcDividerLine(
              color: dividerColor ?? BaseColors.gray_40,
            ),

            /// cancel & confirm buttons
            Expanded(
              flex: 1,
              child: CcRowCenter(children: [
                /// cancel button widget
                isCancelBtnShown
                    ? Expanded(
                        flex: 1,
                        child: getCancelButtonWidget(),
                      )
                    : const SizedBox(),

                /// line widget
                isCancelBtnShown
                    ? Expanded(
                        flex: 0,
                        child: CcDividerHorizontalLine(
                          color: dividerColor ?? BaseColors.gray_40,
                          width: 0.8,
                          height: heightActionBtnBar ?? 60,
                        ))
                    : const SizedBox(),

                /// confirm button widget
                Expanded(
                  flex: 1,
                  child: isCancelBtnShown
                      ? getConfirmButtonWidget()
                      : Container(
                          margin: EdgeInsets.only(
                              left: (CcPaddingParams.PAGE_LARGE * 3.5), right: (CcPaddingParams.PAGE_LARGE * 3.5)),
                          child: getConfirmButtonWidget(),
                        ),
                ),
              ]),
            ),
          ],
        ),
      );

  /// cancel button widget
  Widget getCancelButtonWidget() => SizedBox(
        height: heightActionBtn ?? 35,
        child: CcDebounce(
            onTap: onTapCancel ?? () => Get.back(),
            child: Stack(
              children: [
                ContainerRoundedCorner(
                  color: btnBgColor ?? BaseColors.pink_70,
                ),
                CcText(
                  cancelText ?? 'Cancel',
                  align: Alignment.center,
                  color: cancelTextColor ?? BaseColors.white,
                  fontSize: fontSize ?? 14.0,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      );

  /// confirm button widget
  Widget getConfirmButtonWidget() => SizedBox(
        height: heightActionBtn ?? 35,
        child: CcDebounce(
          onTap: onTapConfirm ?? () => Get.back(),
          child: Stack(
            children: [
              ContainerRoundedCorner(
                color: btnBgColor ?? BaseColors.pink_70,
              ),
              CcText(
                agreeText ?? 'OK',
                align: Alignment.center,
                color: confirmTextColor ?? BaseColors.white,
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? 15.0,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
