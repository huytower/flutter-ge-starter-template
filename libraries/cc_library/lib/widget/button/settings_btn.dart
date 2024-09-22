import 'package:cc_library/widget/inkwell/button_inkwell_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsBtnTopRight extends StatelessWidget {
  const SettingsBtnTopRight(
    this.iconSetting, {
    Key? key,
    required this.onTap,
    this.right = 20.0,
    this.top = 55.0,
    this.opacity = 1.0,
    this.scale = 1.0,
  }) : super(key: key);

  final VoidCallback onTap;
  final double right, top;
  final double opacity;
  final Widget iconSetting;
  final double scale;

  @override
  Widget build(BuildContext context) => Positioned(
      right: right,
      top: top,
      child: Transform.scale(
          scale: scale,
          child: ButtonInkWellCircleWidget(
            onTap: onTap,
            child: iconSetting,
          )));
}
