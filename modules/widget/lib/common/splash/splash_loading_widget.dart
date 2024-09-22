import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// loading|progress widget
/// show in splash screen page
class SplashLoadingWidget extends StatelessWidget {
  const SplashLoadingWidget({Key? key, this.isJsonResId = true, required this.resId, this.width = 115})
      : super(key: key);

  final bool isJsonResId;

  final double width;
  final String resId;

  @override
  Widget build(BuildContext context) => isJsonResId
      ? Lottie.asset(
          resId,
          height: width,
          width: width,
        )
      : const SizedBox();
}
