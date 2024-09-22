import 'package:flutter/material.dart';

class CcText extends StatelessWidget {
  const CcText(
    this.text, {
    Key? key,
    this.align,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.heightLine,
    this.marginLeft,
    this.marginRight,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.textStyle,
  }) : super(key: key);

  final Alignment? align;

  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  final int? maxLines;

  final TextOverflow? overflow;

  final double? fontSize, heightLine, marginLeft, marginRight;

  final String? text;

  final TextAlign? textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(c) {
    final l = marginLeft ?? 0, r = marginRight ?? 0;
    return Align(
      alignment: align ?? Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: l, right: r),
        child: RichText(
          textAlign: textAlign ?? TextAlign.left,
          text: TextSpan(text: text ?? '', style: textStyle ?? getTextStyle()),
          maxLines: maxLines ?? 1,
          overflow: overflow ?? TextOverflow.ellipsis,
        ),
      ),
    );
  }

  TextStyle getTextStyle() => TextStyle(
        height: heightLine ?? 1.2,
        color: color ?? Colors.white,
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: fontStyle ?? FontStyle.normal,
      );
}
