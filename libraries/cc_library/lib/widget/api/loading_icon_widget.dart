import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:flutter/cupertino.dart';

class LoadingIconWidget extends StatelessWidget {
  const LoadingIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: BaseColors.black_40,
            borderRadius: WidgetHelper.getBorderRoundedSmall(),
          ),
          child: getLoadingWidget(),
        ),
      );

  Widget getLoadingWidget() => const CupertinoActivityIndicator(
        color: BaseColors.white,
        radius: 15,
      );
}
