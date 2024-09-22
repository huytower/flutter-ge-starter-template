import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/button/cc_base_btn.dart';
import 'package:flutter/material.dart';

class IconHeart extends StatelessWidget {
  const IconHeart({Key? key, required this.height, this.width, this.size, this.begin, this.end}) : super(key: key);

  final double height;
  final double? size, width;

  final AlignmentGeometry? begin, end;

  @override
  CcBlackShadowBtn build(c) => CcBlackShadowBtn(Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              begin: begin ?? Alignment.topCenter,
              end: end ?? Alignment.bottomCenter,
              colors: [BaseColors.pink, BaseColors.pink],
            )),
        width: width ?? height,
        height: height,
        child: Icon(
          Icons.favorite,
          color: Colors.white,
          size: size ?? 70,
        ),
      ));
}
