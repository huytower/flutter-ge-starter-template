import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/anim/fade_widget.dart';
import 'package:cc_library/widget/api/base_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// this widget show loading progress icon for total page
/// - child param. : total widgets in page
class LoadingPageWidget extends StatelessWidget {
  const LoadingPageWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(c) => FadeWidget(
      visible: true,
      child: Stack(
        children: [
          /// Child
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              child,
            ],
          ),

          /// Background
          Container(
            height: Get.height,
            width: Get.width,
            color: BaseColors.black_70,
          ),

          /// Progress loading icon
          const CcProgressIndicator(),
        ],
      ));
}
