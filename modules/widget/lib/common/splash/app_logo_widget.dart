import 'package:cc_library/widget/padding/cc_padding.dart';
import 'package:flutter/material.dart';

/// App logo widget,
/// show in splash screen
class AppLogoWidget extends StatelessWidget {
  AppLogoWidget({Key? key, this.isImageResId = true, required this.resId, this.padding = 34, this.width = 81})
      : super(key: key);

  final bool isImageResId;
  final double padding, width;
  final String resId;

  @override
  Widget build(BuildContext context) => CcPadding(
        isImageResId
            ? Image.asset(resId,
                width: width,
                height: width,
                errorBuilder: (_, a, b) => Image.asset(
                      'packages/theme/assets/logo/app_logo.png',
                      width: width,
                      height: width,
                    ))
            : const SizedBox(),
        padding,
        padding,
        padding,
        padding,
      );
}
