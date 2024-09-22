import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:flutter/material.dart';

/// Full splash inkwell - object
class InkWellClickFull extends StatelessWidget {
  const InkWellClickFull({Key? key, required this.onTap, required this.height}) : super(key: key);

  final VoidCallback onTap;

  final double height;

  @override
  Widget build(c) => getInkWellWidget();

  Widget getInkWellWidget() => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: BaseColors.black_5,
          // splashColor: ColorsAssets.blueLight,
          borderRadius: WidgetHelper.getBorderRoundedSmall(),
          canRequestFocus: false,
          child: SizedBox(
            height: height,

            /// Values must not == infinity
            width: double.infinity,
          ),

          /// MUST define to avoid bug can not focus first item in list
        ),
      );
}
