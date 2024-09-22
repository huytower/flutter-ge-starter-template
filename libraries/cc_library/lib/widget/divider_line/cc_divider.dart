import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/padding/cc_padding.dart';
import 'package:flutter/material.dart';

/// TOP POPULAR RE-USE WIDGET
/// vertical divider, small vertical divider_line widget
class CcDividerLine extends StatelessWidget {
  const CcDividerLine({Key? key, this.color, this.height, this.padding}) : super(key: key);

  final double? padding, height;

  final Color? color;

  @override
  CcPadding build(c) => CcPadding(
      Divider(
        height: height ?? 0.5,
        color: color ?? BaseColors.white_10,
        thickness: 1,
      ),
      0,
      padding ?? 0.0,
      padding ?? 0.0,
      0);
}

class CcDividerHorizontalLine extends StatelessWidget {
  const CcDividerHorizontalLine({
    Key? key,
    this.color,
    this.height,
    this.padding,
    this.width,
  }) : super(key: key);

  final double? height, padding, width;

  final Color? color;

  @override
  CcPadding build(c) => CcPadding(
      Container(
        width: width ?? 0.1,
        height: height ?? 45.0,
        color: color ?? BaseColors.white_15,
      ),
      0,
      padding ?? 0.0,
      padding ?? 0.0,
      0);
}
