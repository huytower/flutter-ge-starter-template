import 'dart:async';

import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:cc_library/widget/text/cc_text_spans.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class CcCountDown extends StatefulWidget {
  const CcCountDown({
    Key? key,
    required this.callback,
    this.start = 60,

    /// default para.
    this.isInlineSpan = false,
  }) : super(key: key);

  final int start;

  final bool isInlineSpan;

  final callback;

  /// return method, return value to called widget

  @override
  State<CcCountDown> createState() => _CcCountDownState();
}

class _CcCountDownState extends State<CcCountDown> {
  late int current;

  late StreamSubscription sub;

  @override
  void dispose() {
    super.dispose();

    sub.cancel();
  }

  @override
  void initState() {
    super.initState();

    current = widget.start;

    startTimer();
  }

  @override
  Widget build(BuildContext context) => widget.isInlineSpan ? buildTextSpansWidget() : buildTextWidget();

  CcTextSpans buildTextSpansWidget() => CcTextSpans([
        WidgetHelper.getTextSpanMontserrat(" $current' ", color: BaseColors.black, fontSize: 20.0, heightLine: 1.4),
      ]);

  CcText buildTextWidget() => CcText(
        '$current',
        color: Colors.black,
        fontSize: 20,
      );

  void startTimer() {
    var countDownTimer = CountdownTimer(
      Duration(seconds: widget.start),
      const Duration(seconds: 1),
    );

    sub = countDownTimer.listen(null);

    sub.onData((d) {
      int elapse = d.elapsed.inSeconds;

      setState(() {
        current = widget.start - elapse;
      });

      /// Logic : call this function at second = 0
      if (current == 0) {
        widget.callback();
      }
    });

    sub.onDone(() {
      sub.cancel();
    });

    sub.onError((_) {
      sub.cancel();
    });
  }
}
