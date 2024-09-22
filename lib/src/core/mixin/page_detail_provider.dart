// import 'package:cc_library/constant/padding_params.dart';
// import 'package:ext/core/component/export/export_image_view.dart';
// import 'package:ext/core/layout/cc_get_controller/cc_get_controller.dart';
// import 'package:ext/core/layout/cc_get_view/cc_get_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:theme/export/cc_theme_export.dart';
// import 'package:widget/widgets/gesture_detector/cc_gesture_detector_ontap.dart';
//
// /// Target: serves for customize [base|default widgets] :
// /// - base widgets inside `cc_get_view` : `abstract class CcGetView<T extends CcGetController> extends GetView<T>`
// /// popular is customize Header widget|Footer widget.
// /// ex. in section "Ban hang sieu thi" in app Pos, there are :
// ///   - customize Header widget, ex. : Search fields ....
// ///   - customize Footer widget, ex. : customize tab bars.
// /// NOTICE that only uses when need customize [base|default widgets]
// mixin PageDetailProvider<T extends CcGetController> on CcGetView<T> {
//   //----------------------------------------------------------------------------
//
//   Widget buildAppBar(
//     BuildContext context,
//     String title, {
//     TextStyle? titleStyle,
//     Widget? widgetTitle,
//     Widget? rightAction,
//     Widget? leftAction,
//   }) {
//     return Container(
//       margin: EdgeInsets.only(top: Get.mediaQuery.padding.top.clamp(30.ccH, 100.ccH)),
//       width: double.maxFinite,
//       alignment: Alignment.center,
//       height: 60.ccH,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           /// Section : back button
//           leftAction ??
//               CcGestureDetector(
//                 onTap: () => Get.back(),
//                 child: Container(
//                     width: 34.ccW,
//                     height: 60.ccH,
//                     margin: EdgeInsets.only(left: PaddingParams.PADDING_PAGE_SMALL),
//                     alignment: Alignment.centerLeft,
//                     child: CcImageView(
//                       urlPath: ImageResource.ic_back,
//                       type: ImageViewType.svg,
//                       height: 22,
//                       color: ColorResource.color_cc_text_caption_pink_light,
//                     )),
//               ),
//           const Spacer(flex: 1),
//
//           /// Section : Title
//           widgetTitle ??
//               Container(
//                 alignment: Alignment.center,
//                 child: Text(title.getLanguage,
//                     style: titleStyle ??
//                         TextStyleResource.textStyleCaption(context)!
//                             .copyWith(color: ColorResource.color_cc_text_caption_pink_light, fontSize: 26)),
//               ),
//
//           const Spacer(flex: 1),
//           rightAction ??
//               SizedBox(
//                 width: 34,
//               )
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget buildBackground(BuildContext context) {
//     var height = Get.mediaQuery.padding.top.clamp(30.ccH, 100.ccH) + 70.ccH;
//     return Container(
//       alignment: Alignment.topCenter,
//       color: ColorStyleResource.colorAppbarBackground(context),
//       child: imageBackground(context) ??
//           Container(
//             height: height,
//             width: Get.width,
//             alignment: Alignment.topCenter,
//             child: Image.asset(
//               ImageResource.search_product_background,
//               fit: BoxFit.fill,
//               height: height,
//               width: Get.width,
//             ),
//           ),
//     );
//   }
//
//   @override
//   Widget loadingLayout() {
//     return SizedBox();
//   }
//
//   Widget? imageBackground(BuildContext context) {
//     return null;
//   }
// }
