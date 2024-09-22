import 'package:cc_library/helper/widget_helper.dart';
import 'package:flutter/material.dart';

class CcContainerSquare extends StatelessWidget {
  const CcContainerSquare({
    Key? key,
    required this.bgColor,
    required this.width,
    required this.widget,
  }) : super(key: key);

  final Color bgColor;

  final double width;

  final Widget widget;

  @override
  Widget build(c) => Container(
        decoration: BoxDecoration(color: bgColor, borderRadius: WidgetHelper.getBorderRoundedSmall()),
        width: width,
        height: width,
        child: widget,
      );
}
