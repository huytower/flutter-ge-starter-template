import 'package:cc_library/constant/cc_padding_params.dart';
import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerRoundedCorner extends StatelessWidget {
  const ContainerRoundedCorner({Key? key, this.height, this.color}) : super(key: key);

  final Color? color;

  final double? height;

  @override
  Widget build(c) => Center(
        child: Container(
          decoration: BoxDecoration(
            color: color ?? BaseColors.white_80,
            borderRadius: WidgetHelper.getBorderRoundedSmall(),
          ),
          width: Get.width,
          height: height ?? 40,
          margin: EdgeInsets.only(left: CcPaddingParams.PAGE_MID, right: CcPaddingParams.PAGE_MID),
        ),
      );
}
