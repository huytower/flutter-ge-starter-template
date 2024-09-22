import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/flex/cc_row_center.dart';
import 'package:cc_library/widget/inkwell/button_inkwell_widget.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CcSplashBtn extends StatelessWidget {
  const CcSplashBtn(
    this.onTap,
    this.text, {
    Key? key,
    this.borderRadius,
    this.bgColor,
    this.fontSize,
    this.heightLine,
    this.child,
    this.icon,
    this.iconColor = Colors.white,
    this.isEnable = true,
    this.isTextCenter = false,
    this.maxWidth,
    this.maxHeight,
    this.shadowColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  final bool isEnable, isTextCenter;

  final BorderRadius? borderRadius;

  final Color? iconColor, shadowColor, textColor;

  final double? fontSize, heightLine, maxHeight, maxWidth;

  final IconData? icon;

  final List<Color>? bgColor;

  final String text;

  final VoidCallback onTap;

  final Widget? child;

  @override
  Widget build(c) => CcShadowBtn(getContainerWidget(), color: shadowColor);

  BoxConstraints getConstraints() => BoxConstraints(
        maxWidth: maxWidth ?? Get.width,
        maxHeight: maxHeight ?? 44.5,
        minHeight: maxHeight ?? 44.5,
      );

  Widget getContainerWidget() => ButtonInkWellCircleWidget(
        onTap: onTap,
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: getConstraints(),
            child: DecoratedBox(
              decoration: getDecoration(),
              child: getDataWidget(),
            ),
          ),
        ),
      );

  Widget getDataWidget() => (icon == null && child == null)
      ? getTextWidget()
      : CcRowCenter(
          children: <Widget>[
            /// Section : Icon
            Expanded(flex: 1, child: getIconWidget()),

            /// Section : Text
            Expanded(
              flex: 2,
              child: getTextWidget(),
            ),
          ],
        );

  BoxDecoration getDecoration() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: bgColor ?? [BaseColors.black_70, BaseColors.black_70],
        ),
        borderRadius: borderRadius ?? WidgetHelper.getCircleBorderRadius(),
      );

  Widget getIconWidget() => ConstrainedBox(
      constraints: BoxConstraints(minWidth: 60),
      child: child ??
          Icon(
            icon,
            size: 20,
            color: iconColor,
          ));

  Widget getTextWidget() => CcText(
        text,
        align: isTextCenter ? Alignment.center : Alignment.centerLeft,
        color: isEnable ? textColor : BaseColors.white,
        fontSize: fontSize ?? 20.0,
        fontWeight: FontWeight.w600,
        heightLine: heightLine ?? 1.2,
        textAlign: isTextCenter ? TextAlign.center : TextAlign.left,
      );
}

class CcNextBtn extends StatelessWidget {
  const CcNextBtn(
    this.onTap,
    this.text, {
    Key? key,
    this.isEnable = true,

    /// default param. =
    /// 72/9 - closely full width
    /// 40/9 - normal width
    this.aspectRatio,
    this.borderRadius,
    this.colorsGradient,
    this.fontSize,
    this.textColor = BaseColors.white,
  }) : super(key: key);

  final bool isEnable;

  final BorderRadius? borderRadius;

  final Color textColor;

  final double? aspectRatio;
  final double? fontSize;

  final List<Color>? colorsGradient;

  final String text;

  final VoidCallback onTap;

  @override
  Widget build(c) => getContainerWidget();

  Widget getContainerWidget() => ButtonInkWellClipWidget(
        aspectRatio: aspectRatio ?? (72 / 9),
        onTap: onTap,
        child: DecoratedBox(
          decoration: getDecoration(),
          child: getTextWidget(),
        ),
      );

  BoxDecoration getDecoration() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: colorsGradient ?? [BaseColors.black_70, BaseColors.black_70],
        ),
        borderRadius: borderRadius ?? WidgetHelper.getCircleBorderRadius(),
      );

  Widget getTextWidget() => CcText(
        text,
        align: Alignment.center,
        color: isEnable ? textColor : Colors.white,
        fontSize: fontSize ?? 20.0,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center,
      );
}

class CcBlackShadowBtn extends StatelessWidget {
  const CcBlackShadowBtn(this.widget, {Key? key}) : super(key: key);

  final Widget widget;

  @override
  Align build(c) => Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          elevation: 10,
          shadowColor: Colors.black38,
          child: Container(
            child: widget,
          ),
        ),
      );
}

class CcWhiteShadowBtn extends StatelessWidget {
  const CcWhiteShadowBtn(this.widget, {Key? key}) : super(key: key);

  final Widget widget;

  @override
  Align build(c) => Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          elevation: 10,
          shadowColor: Colors.white38,
          child: Container(
            child: widget,
          ),
        ),
      );
}

class CcShadowBtn extends StatelessWidget {
  const CcShadowBtn(this.widget, {Key? key, this.color}) : super(key: key);

  final Widget widget;

  final Color? color;

  @override
  Align build(c) => Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          elevation: 20,
          shadowColor: color ?? BaseColors.black_10,
          child: widget,
        ),
      );
}
