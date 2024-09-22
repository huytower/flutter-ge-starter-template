import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/base_colors.dart';
import '../util/base_utils.dart';

/// Widget utilities
class WidgetHelper {
  /// MUST set these orders, to avoid transparent with drop shadow issue
  static List<BoxShadow> getBoxShadows({
    Color? shadowColor,
    double? x,
    double? y,
    double? blurRadius,
    double? spreadRadius,
    Color? bgColor,
  }) =>
      [
        /// 2 - drop background of child widget
        BoxShadow(
          color: shadowColor ?? BaseColors.black_30,
          spreadRadius: spreadRadius ?? 0.0,
          blurRadius: blurRadius ?? 3.0,
          offset: Offset(x ?? 2.0, y ?? 2.0),
        ),

        /// 1 - below background of child widget,
        BoxShadow(
          color: bgColor ?? Colors.white,
          spreadRadius: 0,
          blurRadius: 0,
          offset: Offset.zero,
        ),
      ];

  static BorderRadius getCircleBorderRadius() => BorderRadius.circular(45);

  static BoxFit getBoxFitType() {
    if (BaseUtils.isProMaxDeviceType()) {
      return BoxFit.fill;
    }

    return BoxFit.cover;
  }

  static Widget getInkResponse(
    VoidCallback onTap, {
    VoidCallback? onTapUp,
    VoidCallback? onTapDown,
    VoidCallback? onLongPress,
    BorderRadius? borderRadius,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          /// clipped splash
          onTap: onTap,
          // splashColor: BaseColors.white_30,
          splashColor: Platform.isAndroid ? BaseColors.black_5 : Colors.transparent,
          borderRadius: borderRadius ?? getCircleBorderRadius(),

          /// MUST define to avoid bug can not focus first item in list
          canRequestFocus: false,
          onTapDown: (_) => onTapDown,
          onTapCancel: onTapUp,
          onLongPress: onLongPress,
        ),
      );

  static Widget getInkResponsePadding(VoidCallback onTap, {BorderRadius? borderRadius, double? aspectRatio}) =>
      AspectRatio(
        aspectRatio: aspectRatio ?? 16 / 9,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            /// clipped splash
            onTap: onTap,
            splashColor: Platform.isAndroid ? BaseColors.black_5 : Colors.transparent,
            // splashColor: BaseColors.black_5,
            borderRadius: borderRadius ?? getCircleBorderRadius(),

            /// MUST define to avoid bug can not focus first item in list
            canRequestFocus: false,
          ),
        ),
      );

  static BorderRadius getBorderRoundedLarge() => BorderRadius.circular(12);

  static BorderRadius getBorderRoundedSmall() => BorderRadius.circular(8);

  static BorderRadius getBorderRoundedSquareTopLeftRight() => const BorderRadius.only(
        topLeft: Radius.circular(9),
        topRight: Radius.circular(9),
      );

  /// Light text span
  static TextSpan getTextSpanMontserrat(
    String text, {
    Color? color,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    double? heightLine,
    GestureRecognizer? recognizer,
  }) =>
      TextSpan(
        recognizer: recognizer,
        style: getTextStyleMontserrat(
          color: color,
          heightLine: heightLine,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontStyle: fontStyle,
        ),
        text: text,
      );

  /// Light text style
  static TextStyle getTextStyleMontserrat({
    Color? color,
    double? heightLine,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
        color: color ?? Colors.white,
        height: heightLine ?? 1.2,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 14.0,
        fontStyle: fontStyle ?? FontStyle.normal,
      );

  /// Special text span
  static TextSpan getTextSpanPacifico(
    String text, {
    Color? color,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    double? heightLine,
    GestureRecognizer? recognizer,
  }) =>
      TextSpan(
        recognizer: recognizer,
        style: getTextStylePacifico(
          color: color,
          heightLine: heightLine,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontStyle: fontStyle,
        ),
        text: text,
      );

  /// Special text style
  static TextStyle getTextStylePacifico({
    Color? color,
    double? heightLine,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.pacifico(
        color: color ?? Colors.white,
        height: heightLine ?? 1.2,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 14.0,
        fontStyle: fontStyle ?? FontStyle.normal,
      );

  /// Normal text span
  static TextSpan getTextSpanRoboto(
    String text, {
    Color? color,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    double? heightLine,
    GestureRecognizer? recognizer,
  }) =>
      TextSpan(
        recognizer: recognizer,
        style: getTextStyleRoboto(
          fontWeight: fontWeight,
          heightLine: heightLine,
          color: color,
          fontSize: fontSize,
          fontStyle: fontStyle,
        ),
        text: text,
      );

  static TextSpan getTextSpanMali(
    String text, {
    Color? color,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    double? heightLine,
    GestureRecognizer? recognizer,
  }) =>
      TextSpan(
        recognizer: recognizer,
        style: getTextStyleMali(
          fontWeight: fontWeight,
          heightLine: heightLine,
          color: color,
          fontSize: fontSize,
          fontStyle: fontStyle,
        ),
        text: text,
      );

  /// Normal text style
  static TextStyle getTextStyleRoboto({
    Color? color,
    double? heightLine,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.roboto(
        fontWeight: fontWeight ?? FontWeight.w400,
        height: heightLine ?? 1.2,
        color: color ?? Colors.white,
        fontSize: fontSize ?? 14,
        fontStyle: fontStyle ?? FontStyle.normal,
      );

  static TextStyle getTextStyleMali({
    Color? color,
    double? heightLine,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.mali(
        fontWeight: fontWeight ?? FontWeight.w400,
        height: heightLine ?? 1.2,
        color: color ?? Colors.white,
        fontSize: fontSize ?? 14,
        fontStyle: fontStyle ?? FontStyle.normal,
      );

  /// Check orientation is portrait|landscape?
  static RxBool isPortraitScreenMode() => Get.context!.isPortrait.obs;

  /// Check device has Notch
  /// ex. iphone x and above ...
  static bool isSafeScreenExisted(
    double paddingBottom,
    double viewPaddingTop,
  ) =>
      paddingBottom >= 20.0 || viewPaddingTop >= 40.0;

  /// Scroll notification method, click
  static bool isScrollingClickEnd(ScrollNotification scrollState) => scrollState is ScrollEndNotification;

  /// Scroll notification method, click
  static bool isScrollingClickStart(ScrollNotification scrollState) => scrollState is ScrollStartNotification;

  /// Scroll notification method, while scrolling
  static bool isScrollingToEnd(ScrollNotification scrollState) =>
      scrollState is UserScrollNotification && scrollState.direction == ScrollDirection.idle;

  static void markNeedsBuild(function) => SchedulerBinding.instance.addPostFrameCallback((_) => function());

  /*
  * Logic : Must check Audio player is running or not, pause it if has
  * for video player can play as normal (avoid duplicate sound)
  * */
  void pauseAudioPlayer(BuildContext c) {
    markNeedsBuild(() {
      // Pause existed Audio Player
      // Constants().getAudioPlayer().pause();

      // Then update Playing state on UI
      // AudioPlayerProvider a =
      //     Provider.of<AudioPlayerProvider>(c, listen: false);
      //
      // if (a != null && a.hasPlayingItem()) a.setPlayingStatus(false);
    });
  }

  /*
  * Logic : Must check Video player is running or not, pause it if has
  * for Audio player can play as normal (avoid duplicate sound)
  * */
  void pauseVideoPlayer() {
    // Notify Videos page about this modify
    markNeedsBuild(() {
      // if (videoPlayerProvider != null && videoPlayerProvider.hasBloc()) {
      //   videoPlayerProvider.bloc.seekToEnd();
      //
      //   videoPlayerProvider.bloc.pause();
      // }
    });
  }

  /// Set orientation : landscape || full-screen mode
  void setLandscape() => SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
      );

  /// Set orientation : [portrait || landscape] switching mode
  void setOrientationDefault() => SystemChrome.setPreferredOrientations(DeviceOrientation.values);

  /// Set orientation : portrait || normal mode
  void setPortrait() => SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      );

  /// Make input scroll controller scroll to top
  void scrollToTop(ScrollController _scrollController) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }
}
