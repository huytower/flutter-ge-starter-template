import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CcShimmer extends StatelessWidget {
  const CcShimmer(
      {Key? key, this.width, this.height = 20, this.borderRadius, this.margin, this.baseColor, this.highlightColor})
      : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.withOpacity(0.5),
      highlightColor: highlightColor ?? Colors.grey,
      period: const Duration(seconds: 3),
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(borderRadius: borderRadius ?? BorderRadius.circular(10), color: Colors.grey),
      ),
    );
  }
}
