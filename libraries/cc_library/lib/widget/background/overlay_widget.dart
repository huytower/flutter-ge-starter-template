import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/base/cc_position.dart';
import 'package:cc_library/widget/padding/cc_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// lay second widget on input widget, as overlay widget
/// ex. second widget = opacity background | gradient background ..v.
class OverlayWidget extends StatelessWidget {
  const OverlayWidget({Key? key, @required this.isLargeBorder, this.color, this.padding, this.width, this.height})
      : super(key: key);

  final bool? isLargeBorder;

  final double? padding, width, height;

  final Color? color;

  @override
  Widget build(BuildContext context) => CcPadding(
      Container(
        decoration: BoxDecoration(
          borderRadius: isLargeBorder! ? WidgetHelper.getBorderRoundedLarge() : WidgetHelper.getBorderRoundedSmall(),
          color: color ?? BaseColors.black_50,
        ),
        height: height ?? Get.height,
        width: width ?? Get.width,
      ),
      padding ?? 1,
      padding ?? 1,
      padding ?? 1,
      padding ?? 1);
}

class OverlayBackgroundWidget extends StatelessWidget {
  const OverlayBackgroundWidget(
      {Key? key, required this.widget, required this.start, required this.end, this.blendMode = BlendMode.multiply})
      : super(key: key);

  final Widget widget;

  final Color start, end;

  final BlendMode blendMode;

  @override
  Widget build(BuildContext context) => ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            start,
            end,
          ],
        ).createShader(rect),
        blendMode: blendMode,
        child: widget,
      );
}

class OverlayGradientWidget extends StatelessWidget {
  const OverlayGradientWidget({Key? key, required this.start, required this.end, this.blendMode}) : super(key: key);

  final Color start, end;
  final BlendMode? blendMode;

  @override
  Widget build(c) => CcPositionCenter(
          child: DecoratedBox(
        decoration: BoxDecoration(
            backgroundBlendMode: blendMode ?? BlendMode.multiply,
            // blend mode
            gradient: LinearGradient(
                colors: [start, end], // gradient stops
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: <double>[0.2, 1]),
            borderRadius: WidgetHelper.getBorderRoundedSmall()),
      ));
}

class OverlayIconWidget extends StatelessWidget {
  const OverlayIconWidget(this.child, {Key? key, required this.start, required this.end}) : super(key: key);

  final Widget child;

  final Color start, end;

  @override
  Widget build(BuildContext context) => ShaderMask(
        shaderCallback: (Rect bounds) => LinearGradient(
          colors: [
            start,
            end,
          ],
        ).createShader(bounds),
        child: child,
      );
}
