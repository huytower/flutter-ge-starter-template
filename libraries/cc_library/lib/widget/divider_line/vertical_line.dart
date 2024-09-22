import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalLineWidget extends StatelessWidget {
  const VerticalLineWidget({Key? key, required this.flex}) : super(key: key);

  final int flex;

  @override
  Flexible build(BuildContext context) => Flexible(
        flex: flex,
        child: Container(
          margin: const EdgeInsets.only(left: 0, top: 2),
          color: BaseColors.black_5,
          height: 1,
        ),
      );
}

class VerticalLineShadowFirstWidget extends StatelessWidget {
  const VerticalLineShadowFirstWidget({Key? key, required this.width}) : super(key: key);

  final double? width;

  @override
  ClipRRect build(BuildContext context) => ClipRRect(
        borderRadius: WidgetHelper.getBorderRoundedSquareTopLeftRight(),
        child: Container(
          color: BaseColors.black_5,
          width: width ?? 96,
          height: 6,
        ),
      );
}

class VerticalLineShadowSecondWidget extends StatelessWidget {
  const VerticalLineShadowSecondWidget({Key? key, required this.width}) : super(key: key);

  final double? width;

  @override
  ClipRRect build(BuildContext context) => ClipRRect(
        borderRadius: WidgetHelper.getBorderRoundedSquareTopLeftRight(),
        child: Container(
          color: BaseColors.black_10,
          width: width ?? 128,
          height: 6,
        ),
      );
}
