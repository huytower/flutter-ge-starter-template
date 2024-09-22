// import 'package:app_config/enum/layout_status.dart';
// import 'package:data/config/retrofit/response/body/cc_response.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// mixin LayoutStatusProvider<T extends CcResponse> on GetxController {
//   Rx<LayoutStatus> layoutStatus = Rx<LayoutStatus>(LayoutStatus.loading);
//   T? response;
//
//   Widget multipleLayoutStates({
//     Function(LayoutStatus? layoutStatus)? onChangeState,
//     required Widget Function() onLoading,
//     required Widget Function(T? response) onSuccess,
//     Function<Widget>()? empty,
//     required Widget Function(String code) onError,
//   }) {
//     onChangeState?.call(LayoutStatus.loading);
//     return Obx(
//       () {
//         // return when(
//         //   value: layoutStatus,
//         //   conditions: {
//         //     LayoutStatus.loading: () {
//         //       return onLoading();
//         //     },
//         //     LayoutStatus.success: () {
//         //       return onSuccess(response);
//         //     }
//         //   },
//         //   orElse: onError("100"),
//         // );
//         if (layoutStatus.value == LayoutStatus.loading) {
//         // if (layoutStatus.value == LayoutStatus.loading || layoutStatus.value == LayoutStatus.loadingLayer) {
//           return onLoading();
//         } else {
//           return onSuccess(response);
//         }
//       },
//     );
//   }
// }
