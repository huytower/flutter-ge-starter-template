import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// POPULAR WIDGET
/// Skeleton|Shimmer|Waiting|Loading text (Loading text widget), is showing while loading data from API response.
class TitleLoadingWidget extends StatelessWidget {
  const TitleLoadingWidget({Key? key, this.lineWidth, this.lineHeight}) : super(key: key);

  final double? lineHeight, lineWidth;

  @override
  Widget build(BuildContext c) => getEmptyContainer();

  Widget getEmptyContainer() => SizedBox(
        width: lineWidth ?? 50,
        height: lineHeight ?? 14,
        child: Shimmer.fromColors(
          baseColor: BaseColors.black_5,
          highlightColor: Colors.yellow,
          child: Container(
            width: lineWidth ?? 50,
            height: 12,
            decoration: BoxDecoration(color: BaseColors.black_5, borderRadius: WidgetHelper.getBorderRoundedLarge()),
          ),
        ),
      );
}
