import 'package:cc_library/util/extension_utils.dart';
import 'package:cc_library/widget/image/fade_in_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_animations/stateless_animation/loop_animation.dart';
import 'package:simple_animations/timeline_tween/timeline_tween.dart';

// Create enum that defines the animated properties
enum AniProps { x, y, scale, rotate, opacity }

/// Object animation
class AnimatedObjectWidget extends StatelessWidget {
  const AnimatedObjectWidget({
    Key? key,
    this.bgAssetPath,
    this.iconAssetPath,
    this.durationBegin = 10,
    this.durationEnd = 10,
    this.opacityBegin = 0.1,
    this.opacityEnd = 0.5,
    this.rotateBegin = 0.0,
    this.rotateEnd = 0.0,
    this.rotateBox = 3,
    this.scaleBegin = 0.5,
    this.scaleEnd = 2.0,
    this.startTime = 1,

    /// default params. : left -> right
    this.xBegin = -250.0,

    /// default params. : left -> right
    this.xEnd = 250.0,

    /// default params. : top -> bottom

    this.yBegin = -250.0,

    /// default params. : top -> bottom
    this.yEnd = 250.0,
  }) : super(key: key);

  final String? bgAssetPath, iconAssetPath;

  final int durationBegin, durationEnd, rotateBox, startTime;

  final double opacityBegin, opacityEnd, rotateBegin, rotateEnd, scaleBegin, scaleEnd, xBegin, xEnd, yBegin, yEnd;

  @override
  Widget build(BuildContext context) {
    /// Specify your tween
    final _tween = getTimelineTween();

    return getContainerWidget(_tween);
  }

  Widget getBackgroundWidget() => ClipRRect(
        child: bgAssetPath != null
            ? Container(
                child: ExtensionUtils.isLottieExtension(bgAssetPath!)
                    ?

                    /// Load a Lottie file from assets
                    Lottie.asset(bgAssetPath!)
                    :

                    /// Load either of *.svg, *.jpg, *.png, ... from assets
                    Image.asset(
                        bgAssetPath!,
                        fit: BoxFit.cover,
                      ),
              )
            : const SizedBox(),
      );

  Widget getContainerWidget(_tween) => getIconAnimWidget(_tween);

  Widget getIconAnimWidget(_tween) => LoopAnimation<TimelineValue<AniProps>>(
        tween: _tween,

        /// Pass in tween
        duration: _tween.duration,

        /// Obtain duration
        builder: (context, child, value) {
          /// widget
          final child = Opacity(
            opacity: value.get(AniProps.opacity),
            child: getIconResWidget(),
          );

          /// rotate box == rotate input resource
          final rotateBoxChild = RotatedBox(
            quarterTurns: rotateBox,
            child: child,
          );

          /// scale animation
          final scale = Transform.scale(
            scale: value.get(AniProps.scale),
            child: rotateBoxChild,
          );

          /// rotate animation
          // final rotate = Transform.rotate(
          //   angle: value.get(AniProps.rotate),
          //   child: scale,
          // );

          /// translate animation
          final translate = Transform.translate(
            offset: Offset(value.get(AniProps.x), value.get(AniProps.y)),
            child: scale,
          );

          /// rotate animation
          final rotate = Transform.rotate(
            angle: value.get(AniProps.rotate),
            child: translate,
          );

          return rotate;
        },
      );

  Widget getIconResWidget() => iconAssetPath != null
      ? ExtensionUtils.isLottieExtension(iconAssetPath!)
          ?

          /// Load a Lottie file from assets
          Lottie.asset(iconAssetPath!)
          :

          /// Load either of *.svg, *.jpg, *.png, ... from assets
          FadeInAssetWidget(
              placeholder: iconAssetPath!,
            )
      : const SizedBox();

  TimelineTween<AniProps> getTimelineTween() => TimelineTween<AniProps>()

    /// First animation
    ..addScene(begin: Duration(seconds: startTime), duration: Duration(seconds: durationBegin))
        .animate(
          AniProps.x,
          tween: Tween(begin: xBegin, end: xEnd),
        )
        .animate(AniProps.opacity, tween: Tween(begin: opacityBegin, end: opacityEnd))
        .animate(
          AniProps.scale,
          tween: Tween(begin: scaleBegin, end: scaleEnd),
        )
        .animate(AniProps.rotate, tween: Tween(begin: rotateBegin, end: rotateEnd))

    /// Second animation
    ..addScene(begin: Duration(seconds: startTime + 2), duration: Duration(seconds: durationEnd))
        .animate(AniProps.y, tween: Tween(begin: yBegin, end: yEnd));
}
