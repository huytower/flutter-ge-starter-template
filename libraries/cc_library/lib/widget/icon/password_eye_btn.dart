import 'package:cc_library/widget/inkwell/inkwell_click.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Use *.svg icon only
class PasswordEyeButtonWidget extends StatelessWidget {
  const PasswordEyeButtonWidget(
    this.icon, {
    Key? key,
    this.onTap,
    this.aspectRatio,
  }) : super(key: key);

  final onTap;

  final aspectRatio, icon;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Center(child: SvgPicture.asset(icon)),
          InkWellClick(
            onTap: onTap,
          ),
        ],
      );
}
