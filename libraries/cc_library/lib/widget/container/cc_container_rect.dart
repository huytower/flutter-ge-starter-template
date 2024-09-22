import 'package:cc_library/helper/widget_helper.dart';
import 'package:flutter/material.dart';

class ContainerRectWidget extends StatelessWidget {
  const ContainerRectWidget({
    Key? key,
    required this.bgColor,
    required this.width,
    required this.height,
    required this.widget,
  }) : super(key: key);

  final Color bgColor;

  final double width, height;

  final Widget widget;

  @override
  Widget build(c) => Container(
        decoration: BoxDecoration(color: bgColor, borderRadius: WidgetHelper.getBorderRoundedSmall()),
        width: width,
        height: height,
        child: widget,
      );
}
