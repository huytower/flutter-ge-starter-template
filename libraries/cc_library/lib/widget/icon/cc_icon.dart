import 'package:cc_library/widget/inkwell/inkwell_click.dart';
import 'package:cc_library/widget/padding/cc_padding.dart';
import 'package:flutter/material.dart';

class CcIcon extends StatelessWidget {
  const CcIcon({
    Key? key,
    required this.icon,
    this.size,
    this.color,
    this.align,
  }) : super(key: key);

  final Alignment? align;

  final Color? color;

  final IconData icon;

  final double? size;

  @override
  Align build(c) => Align(
        alignment: align ?? Alignment.center,
        child: CcPadding(
            Icon(
              icon,
              size: size ?? 5.0,
              color: color ?? Colors.black,
            ),
            8,
            8,
            8,
            8),
      );
}

class CcMediaIcon extends StatelessWidget {
  const CcMediaIcon({
    Key? key,
    this.onTap,
    required this.isVisible,
    required this.icon,
    this.iconSize,
    required this.color,
  }) : super(key: key);

  final bool isVisible;

  final Color color;

  final dynamic icon;

  final double? iconSize;

  final onTap;

  @override
  Widget build(c) => getIconPlayControllerWidget();

  Widget getIconPlayControllerWidget() => Stack(
        children: [
          isVisible
              ? CcIcon(
                  icon: icon,
                  size: iconSize ?? 20.0,
                  color: color,
                  align: Alignment.center,
                )
              : const SizedBox(
                  width: 35,
                ),
          InkWellClick(onTap: onTap),
        ],
      );
}
