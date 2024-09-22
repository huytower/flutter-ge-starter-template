import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({Key? key, this.progress, this.size}) : super(key: key);

  final progress, size;

  @override
  Widget build(BuildContext context) => Center(
        child: FAProgressBar(
          currentValue: progress ?? 0,
          size: size ?? 5,
          borderRadius: WidgetHelper.getCircleBorderRadius(),
          backgroundColor: BaseColors.black_70,
          progressColor: BaseColors.blue,
        ),
      );
}
