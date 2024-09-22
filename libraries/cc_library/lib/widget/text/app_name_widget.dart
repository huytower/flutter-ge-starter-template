import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AppNameWidget extends StatelessWidget {
  const AppNameWidget(this.name, {Key? key, this.color, this.fontSize, this.maxLines}) : super(key: key);

  final String name;
  final Color? color;
  final double? fontSize;
  final int? maxLines;

  @override
  Widget build(BuildContext context) => CcText(
        name,
        align: Alignment.center,
        color: color ?? BaseColors.black_40,
        heightLine: 1.4,
        fontSize: fontSize ?? 32.0,
        maxLines: maxLines ?? 3,
      );
}
