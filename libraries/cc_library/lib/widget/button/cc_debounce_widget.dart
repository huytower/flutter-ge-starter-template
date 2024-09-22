import 'package:cc_library/constant/cc_padding_params.dart';
import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/flex/cc_row_center.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';

/// POPULAR WIDGET
/// + make bounce|debounce animation for input widget, ex. button .v.v.
class CcDebounce extends StatelessWidget {
  final VoidCallback? onTap;

  final bool isEnable, isTextCenter, isVisible;

  final BorderRadius? borderRadius;
  final BoxDecoration? decoration;

  final Color? iconColor, shadowColor, textColor;

  final double? fontSize, height, width;

  final Duration? cooldown;
  final EdgeInsets? margin;

  final IconData? icon;

  final List<Color>? bgColor;

  final String title;

  /// Input widget, ex. : Text component or [Icon + Text] components
  final Widget? child;

  const CcDebounce({
    Key? key,
    required this.onTap,
    this.height,
    this.width,
    this.bgColor,
    this.borderRadius,
    this.cooldown = const Duration(milliseconds: 750),
    this.decoration,
    this.fontSize,
    this.icon,
    this.iconColor,
    this.isEnable = true,
    this.isTextCenter = true,
    this.isVisible = true,
    this.margin,
    this.shadowColor,
    this.textColor,
    this.title = '',
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Visibility(
        visible: isVisible,
        child: Bounceable(
          onTap: onTap,
          child: buildBody(),
        ),
      );

  Widget buildBody() =>
      child ??
      Container(
          width: width ?? Get.width,
          height: height ?? 45,
          alignment: Alignment.center,
          decoration: decoration ?? buildDecoration(),
          margin: margin ?? EdgeInsets.only(left: CcPaddingParams.PAGE_MID, right: CcPaddingParams.PAGE_MID),
          child: icon != null ? buildIconRow() : buildBtnText());

  CcText buildBtnText() => CcText(
        title,
        align: isTextCenter ? Alignment.center : Alignment.centerLeft,
        color: isEnable ? textColor : BaseColors.black_50,
        fontSize: fontSize ?? 16.0,
        fontWeight: FontWeight.w500,
        textAlign: isTextCenter ? TextAlign.center : TextAlign.left,
      );

  BoxDecoration buildDecoration() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: bgColor ?? [BaseColors.pink_70, BaseColors.pink_70],
        ),
        borderRadius: borderRadius ?? WidgetHelper.getCircleBorderRadius(),
      );

  Widget buildIcon() => Icon(
        icon,
        size: 15,
        color: iconColor ?? BaseColors.white_80,
      );

  Widget buildIconRow() => CcRowCenter(children: [
        /// icon
        buildIcon(),

        const CcSpaceSmall(),

        /// text
        buildBtnText(),
      ]);
}
