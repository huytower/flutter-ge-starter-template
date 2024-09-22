import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/widget/inkwell/inkwell_click.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// TOP POPULAR RE-USE WIDGET
/// use for Button widget only, easy-click widget by put height, width

/// shape = circle
class ButtonInkWellCircleWidget extends StatelessWidget {
  const ButtonInkWellCircleWidget({
    Key? key,
    required this.onTap,
    required this.child,
    this.height,
    this.width,
  }) : super(key: key);

  final VoidCallback onTap;

  final double? height, width;

  final Widget child;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height ?? 45.0,
          minWidth: width ?? 45.0,
        ),
        child: Center(
          child: Stack(
            children: [
              child,
              InkWellClick(onTap: onTap),
            ],
          ),
        ),
      );
}

/// shape = clip, this shape included : circle, rectangle, clip .v.v.
/// aspectRatio : default = 16/9; ex. 1/1, 16/9 .v.v.v
/// borderRadius : default = circle; ex. rectangle = BorderRadius.all(0.0) .v.v.
class ButtonInkWellClipWidget extends StatelessWidget {
  const ButtonInkWellClipWidget({
    Key? key,
    required this.onTap,
    required this.child,
    this.aspectRatio = 16 / 9, // default para. = 16/9
    this.borderRadius,
    this.height, // default para. = 45.0
    this.isCenter = false,

    /// popular used in Row, Column
  }) : super(key: key);

  final VoidCallback onTap;

  final bool isCenter;

  final double? aspectRatio, height;

  final BorderRadius? borderRadius;

  final Widget child;

  @override
  Widget build(BuildContext context) => isCenter ? Center(child: getContainerWidget()) : getContainerWidget();

  SizedBox getContainerWidget() => SizedBox(
        height: height ?? 45.0,
        child: Stack(
          children: [
            child,
            InkWellClick(
              onTap: onTap,
              borderRadius: borderRadius ?? WidgetHelper.getCircleBorderRadius(), // default para. = circle
            ),
          ],
        ),
      );
}
