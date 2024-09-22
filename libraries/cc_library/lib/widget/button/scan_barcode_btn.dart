import 'package:cc_library/util/extension_utils.dart';
import 'package:cc_library/widget/inkwell/inkwell_safe.dart';
import 'package:cc_library/widget/padding/cc_padding.dart';
import 'package:cc_library/widget/shadow/shadow_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScanBarcodeBtn extends StatelessWidget {
  const ScanBarcodeBtn({Key? key, this.onTap, this.src = '', this.icon, this.size, this.hasShadow = false})
      : super(key: key);

  final bool hasShadow;

  final Icon? icon;

  final double? size;

  final String src;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size ?? 45,
        height: size ?? 45,
        child: buildInkWellSafe(),
      );

  CcPadding buildContainer() => CcPadding(getChild, 6, 6, 6, 6);

  InkWellSafe buildInkWellSafe() => InkWellSafe(
        onTap: onTap ?? () {},
        child: hasShadow
            ? ShadowWidget(
                buildContainer(),
              )
            : buildContainer(),
      );

  Widget get getChild =>
      icon ??
      (ExtensionUtils.isSvgExtension(src)
          ? SvgPicture.asset(
              src,
              fit: BoxFit.contain,
            )
          : Image.asset(
              src,
            ));
}
