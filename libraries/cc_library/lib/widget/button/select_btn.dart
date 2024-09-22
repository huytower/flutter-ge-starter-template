import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/inkwell/button_inkwell_widget.dart';
import 'package:cc_library/widget/padding/cc_padding.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// select button widget, able to get these states :
/// - selected
/// - unselected
class SelectBtn extends StatelessWidget {
  const SelectBtn({Key? key, required this.onTap, required this.text, this.bgColor, this.fontFamily, this.fontWeight})
      : super(key: key);

  final VoidCallback onTap;

  final String text;

  final Color? bgColor;

  final FontStyle? fontFamily;

  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) => Container(
        height: 44,
        decoration: getDecoration(),
        child: getDataWidget(),
      );

  Widget getDataWidget() => ButtonInkWellClipWidget(
        onTap: onTap,
        aspectRatio: 7.5,

        /// min value to get full width, height for item
        child: getTextWidget(),
      );

  BoxDecoration getDecoration() =>
      BoxDecoration(color: bgColor ?? BaseColors.black_70, borderRadius: WidgetHelper.getCircleBorderRadius());

  Widget getTextWidget() => CcPadding(
      CcText(
        text,
        fontSize: 18.0,
      ),
      0,
      21,
      21,
      0);
}
