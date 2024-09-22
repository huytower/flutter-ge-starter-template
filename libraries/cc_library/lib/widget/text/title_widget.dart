import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:cc_library/widget/text/title_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {Key? key,
      required this.title,
      this.align,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.heightLine,
      this.maxLines})
      : super(key: key);

  final Alignment? align;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize, heightLine;
  final int? maxLines;
  final String title;

  @override
  Widget build(BuildContext context) => getTitleWidget();

  Widget getTitleWidget() => title.isNotEmpty
      ? CcText(
          title,
          fontSize: fontSize ?? 16.0,
          color: color ?? BaseColors.black_80,
          fontWeight: fontWeight ?? FontWeight.w600,
          align: align ?? Alignment.centerLeft,
          maxLines: maxLines ?? 1,
          heightLine: heightLine ?? 1.2,
        )
      : const TitleLoadingWidget(lineWidth: 150);
}
