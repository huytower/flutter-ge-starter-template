import 'package:cc_library/helper/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerRoundedCornerTopLeftRight extends StatelessWidget {
  const ContainerRoundedCornerTopLeftRight({Key? key}) : super(key: key);

  @override
  Container build(c) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: WidgetHelper.getBorderRoundedSquareTopLeftRight(),
        ),
        width: Get.width,
        height: 4,
      );
}
