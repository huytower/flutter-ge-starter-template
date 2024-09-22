import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/material.dart';

class TitleWarningErrorWidget extends StatelessWidget {
  const TitleWarningErrorWidget(this.title,
      {Key? key,
      this.bottom,
      this.fontSize,
      this.isTextCenter = true,
      this.heightLine,
      this.maxLine = 2,
      this.textColor,
      this.top})
      : super(key: key);

  final bool isTextCenter;

  final Color? textColor;

  final double? bottom, fontSize, heightLine, top;

  final int maxLine;

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: bottom ?? 20, top: top ?? 20),
        child: CcText(
          title,
          align: isTextCenter ? Alignment.center : Alignment.centerLeft,
          color: textColor ?? BaseColors.red,
          fontSize: fontSize ?? 16,
          heightLine: heightLine ?? 1.2,
          maxLines: maxLine,
          textAlign: isTextCenter ? TextAlign.center : TextAlign.left,
        ),
      );
}
