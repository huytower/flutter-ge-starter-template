import 'package:cc_library/helper/widget_helper.dart';
import 'package:flutter/material.dart';

class CcContainerCircle extends StatelessWidget {
  const CcContainerCircle(
      {Key? key,
      this.child,
      this.bgColor = Colors.transparent,
      this.hasShadow = false,
      this.shadowColor = Colors.transparent,
      this.strokeColor = Colors.transparent,
      this.strokeWidth = 0.0,
      this.width = 28.0})
      : super(key: key);

  final Widget? child;

  final bool hasShadow;

  final Color bgColor, shadowColor, strokeColor;

  final double strokeWidth, width;

  @override
  Widget build(BuildContext context) => Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: Border.all(color: strokeColor, width: strokeWidth),
        boxShadow: hasShadow ? WidgetHelper.getBoxShadows(shadowColor: shadowColor) : [],
      ),
      child: child ?? const SizedBox());
}
