import 'dart:async';

import 'package:flutter/material.dart';

class Toast {
  static final int LENGTH_SHORT = 1;
  static final int LENGTH_LONG = 2;
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;

  static void show(String? msg, BuildContext context,
      {int duration = 1,
      int gravity = 0,
      Color backgroundColor = const Color(0xAA000000),
      Color textColor = Colors.white,
      double backgroundRadius = 20,
      Border? border}) {
    ToastView.dismiss();
    ToastView.createView(msg, context, duration, gravity, backgroundColor, textColor, backgroundRadius, border);
  }
}

class ToastView {
  static final ToastView _singleton = new ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState? overlayState;
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;
  static int currentTime = 0;
  static Timer? timer;

  static void createView(String? msg, BuildContext context, int duration, int gravity, Color background,
      Color textColor, double backgroundRadius, Border? border) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
          widget: Container(
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () {
//                currentTime += 10;
                dismiss();
                if (timer != null) {
                  timer!.cancel();
                }
              },
              onDoubleTap: () {
                if (timer != null) {
                  timer!.cancel();
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(backgroundRadius),
                    border: border,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: Text(msg!,
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 13,
                        color: textColor,
                      )),
                ),
              ),
            ),
          ),
          gravity: gravity),
    );
    _isVisible = true;
    overlayState!.insert(_overlayEntry!);
    currentTime = duration;
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer.periodic(Duration(seconds: 1), (timerCb) {
//      UtilHelper.printCustom("currentTime $currentTime");
      currentTime--;
      if (currentTime <= 0) {
        timer!.cancel();
        dismiss();
      }
    });
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget extends StatelessWidget {
  ToastWidget({
    Key? key,
    this.widget,
    this.gravity,
  }) : super(key: key);

  final Widget? widget;
  final int? gravity;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
//        top: gravity == 2 ? 50 : null,
//           top: 45,
        bottom: 100,
//        bottom: gravity == 0 ? 30 : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}
