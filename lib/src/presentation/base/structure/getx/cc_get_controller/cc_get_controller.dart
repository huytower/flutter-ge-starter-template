import 'package:app_config/enum/layout_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/export/cc_ktx_export.dart';

abstract class CcGetController extends SuperController {
  Rx<LayoutStatus> layoutStatus = Rx<LayoutStatus>(LayoutStatus.loading);

  @override
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  /// is override? onChangeState?
  Widget multipleLayoutStates({
    Function(LayoutStatus? layoutStatus)? onChangeState,
    required Widget Function() onLoading,
    required Widget Function() onSuccess,
    Function<Widget>()? empty,
    required Widget Function(String code) onError,
  }) {
    onChangeState?.call(LayoutStatus.loading);

    if (!initialized) {
      return const SizedBox();
    }

    if (layoutStatus.value == LayoutStatus.loading) {
      return onLoading();
    } else {
      return onSuccess();
    }

    // return Obx(
    //   () {
    //     // return when(
    //     //   variable: layoutStatus,
    //     //   conditions: {
    //     //     LayoutStatus.loading: () {
    //     //       return onLoading();
    //     //     },
    //     //     LayoutStatus.success: () {
    //     //       return onSuccess(response);
    //     //     }
    //     //   },
    //     //   orElse: onError("100"),
    //     // );
    //     if (layoutStatus.value == LayoutStatus.loading || layoutStatus.value == LayoutStatus.loadingLayer) {
    //       return onLoading();
    //     } else {
    //       return onSuccess();
    //     }
    //   },
    // );
  }
}
