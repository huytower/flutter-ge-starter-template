import 'package:cc_library/constant/cc_padding_params.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/inkwell/button_inkwell_widget.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkipBtn extends StatelessWidget {
  const SkipBtn(
    this.text, {
    Key? key,
    required this.onTap,
    this.align = Alignment.centerRight,
    this.aspectRatio = 16 / 9,
    this.fontSize = 16.0,
    this.height = 44.5,
    this.isHover = true,
    required this.isVisible,
    this.textAlign = TextAlign.right,
  }) : super(key: key);

  final VoidCallback onTap;

  final bool isHover, isVisible;

  final Alignment align;

  final double aspectRatio, fontSize, height;

  final String text;

  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) => isVisible
      ? Container(
          height: height,
          margin: EdgeInsets.only(
              bottom: isHover ? CcPaddingParams.PAGE_LARGE : 0.0,
              left: isHover ? CcPaddingParams.PAGE_LARGE : 0.0,
              right: isHover ? CcPaddingParams.PAGE_LARGE : 0.0,
              top: isHover ? CcPaddingParams.PAGE_LARGE : 0.0),
          child: isHover
              ? ButtonInkWellClipWidget(
                  aspectRatio: aspectRatio,
                  onTap: onTap,
                  child: getDataWidget(),
                )
              : GestureDetector(onTap: onTap, child: getDataWidget()),
        )
      : const SizedBox();

  Widget getDataWidget() => CcText(
        text,
        align: align,
        color: BaseColors.gray,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        textAlign: textAlign,
      );
}
