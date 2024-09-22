import 'package:cc_library/extension/kotlin/when_expression.dart';
import 'package:cc_library/widget/pull_to_refresh/cc_refresh_indicator.dart';
import 'package:cc_library/widget/pull_to_refresh/cc_refresh_indicator_icon.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:app_config/constant/assets_resource.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// POPULAR MIXIN
/// - Pull to refresh
/// is best for tracking
/// - Firebase Analytics
/// via state
/// - drag, load, complete ...
///
mixin CcPullRefreshMixin {
  Widget buildIcComplete(Widget? iconCompleteWidget) {
    return iconCompleteWidget ??
        Lottie.asset(
          getAssetIconJson(resId: AssetResLoading.IC_COMPLETE),
          height: 35,
        );
  }

  Column buildIcLoading(Widget? loadingLabelWidget) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CcSpaceSmall(),
        Lottie.asset(
          getAssetIconJson(resId: AssetResLoading.IC_LOADING),
          height: 35,
        ),
        const CcSpaceSmallest(),
        loadingLabelWidget ??
            const CcText(
              'Đang cập nhật',
              color: Colors.grey,
              textAlign: TextAlign.center,
              align: Alignment.center,
            )
      ],
    );
  }

  Widget buildPullToRefresh({
    CcIndicatorController? controller,
    Future<void> Function()? onCancel,
    Widget? icCompleteWidget,
    Widget? icLoadingWidget,
    required Future<void> Function() onRefresh,
    required Widget child,
    double? imageSize,
    double? indicatorSize,
  }) {
    return CcCustomRefreshIndicator(
        completeStateDuration: const Duration(milliseconds: 100),
        controller: controller,
        onCancel: onCancel,
        onRefresh: onRefresh,
        onStateChanged: buildIndicatorChangeStatus,
        builder: (BuildContext context, Widget child, CcIndicatorController controller) => getBuilder(
              child: child,
              controller: controller,
              imageSize: imageSize,
              indicatorSize: indicatorSize,
              icCompleteWidget: icCompleteWidget,
              icLoadingWidget: icLoadingWidget,
            ),
        child: child);
  }

  void buildIndicatorChangeStatus(IndicatorStateChange changeStatus) {
    // 'buildPullRefresh : onStateChanged() = $changeStatus'.Log();

    when(variable: changeStatus, conditions: {
      IndicatorState.dragging: () {},
      IndicatorState.loading: () {},
      IndicatorState.complete: () {},
    });
  }

  CcRefreshIndicatorIcon getBuilder({
    Widget? icCompleteWidget,
    Widget? icLoadingWidget,
    double? imageSize,
    double? indicatorSize,
    required CcIndicatorController controller,
    required Widget child,
  }) {
    return CcRefreshIndicatorIcon(
      controller: controller,
      imageSize: imageSize ?? 70,
      indicatorSize: indicatorSize ?? 70,
      icLoadingWidget: buildIcLoading(icLoadingWidget),
      icCompleteWidget: buildIcComplete(icCompleteWidget),
      child: child,
    );
  }
}
