import 'package:cc_library/util/extension_utils.dart';
import 'package:cc_library/widget/inkwell/inkwell_safe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Use *.svg|icon|*.png assets
class CcCloseBtn extends StatelessWidget {
  CcCloseBtn({
    Key? key,
    this.bgColor = Colors.transparent,
    this.height,
    this.icon,
    required this.onTap,
    this.src = '',
    this.width,
  }) : super(key: key);

  final Color bgColor;

  final double? height, width;

  final Icon? icon;

  final String src;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWellSafe(
        onTap: onTap,
        child: buildSizedBox(),
      );

  Container buildContainer() =>
      Container(alignment: Alignment.center, height: 20.0, width: 20.0, color: bgColor, child: buildIcon());

  Widget buildIcon() =>
      icon ??
      (ExtensionUtils.isSvgExtension(src)
          ? SvgPicture.asset(
              src,
            )
          : Image.asset(
              src,
            ));

  Widget buildSizedBox() => Center(
        child: SizedBox(
          width: width ?? 35,
          height: height ?? 35,
          child: buildContainer(),
        ),
      );
}
