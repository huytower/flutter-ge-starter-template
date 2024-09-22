import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/widget/base/cc_position.dart';
import 'package:flutter/material.dart';

/// Customize splash inkwell - object
class InkWellClick extends StatelessWidget {
  const InkWellClick({
    Key? key,
    required this.onTap,
    this.borderRadius,
    this.onLongPress,
    this.onTapUp,
    this.onTapDown,
  }) : super(key: key);

  final BorderRadius? borderRadius;

  final VoidCallback onTap;
  final VoidCallback? onLongPress, onTapDown, onTapUp;

  @override
  CcPositionCenter build(c) => CcPositionCenter(
        child: getInkWellWidget(),
      );

  Widget getInkWellWidget() => WidgetHelper.getInkResponse(
        onTap,
        borderRadius: borderRadius ?? WidgetHelper.getCircleBorderRadius(),
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onLongPress: onLongPress,
      );
}
