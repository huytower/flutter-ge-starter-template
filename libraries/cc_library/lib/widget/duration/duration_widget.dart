import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({Key? key, required this.duration, this.widgetLoading}) : super(key: key);

  final String duration;

  final Widget? widgetLoading;

  @override
  Widget build(c) => Positioned(
        bottom: 4,
        right: 4,
        child: Row(
          children: [
            widgetLoading ?? Container(),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 16,
              width: 32,
              child: CcText(
                duration,
                color: BaseColors.white,
                fontSize: 10,
                align: Alignment.center,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
