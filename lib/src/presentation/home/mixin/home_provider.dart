import 'package:app_config/enum/routing_manager_enum.dart';
import 'package:cc_library/helper/open_dialog.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/flex/cc_column_center.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:app_config/constant/assets_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/structure/getx/cc_get_view/cc_get_view.dart';
import '../get_x/home_controller.dart';

mixin HomeProvider<T extends HomeController> on CcGetView<T> {
  late HomeController homeController = controller;

  //----------------------------------------------------------------------------
  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      title: InkWell(
        onTap: () {
          var isEnable = true;
          controller.onChangeModeTest(isEnable);
        },
        child: Image.asset(
          getAssetLogo(resId: AssetResLogo.LOGO),
          width: 60,
        ),
      ),
      // SvgPicture.asset(
      //   getAssetIcons(resId: ASSET_LOGO),
      //   fit: BoxFit.contain,
      //   width: 60,
      // ),
      backgroundColor: Colors.pinkAccent,
      leading: const SizedBox(),
      // leading: BaseBackButton(
      //     onPress: () {
      //       /// show confirm exit dialog
      //       OpenDialog.showDialogMessage(
      //           w: CcColCenter(
      //             children: [
      //               const CcSpaceLarge(),
      //
      //               CcText(
      //                 'Do you want to exit app?',
      //                 align: Alignment.center,
      //                 color: Colors.black_70,
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.w500,
      //                 textAlign: TextAlign.center,
      //               ),
      //             ],
      //           ),);
      //     },
      //     icon: Icons.arrow_back_ios_new),
      leadingWidth: 0,
      actions: [
        GestureDetector(
          onTap: () {
            /// show confirm exit dialog
            OpenDialog.showDialogMessage(
              onTapOK: () {},
              // onTapOK: () => Get.toNamed(PageNameEnum.LOGOUT.name),
              w: CcColCenter(
                children: [
                  const CcSpaceLarge(),
                  CcText(
                    'Do you want to logout current user?',
                    align: Alignment.center,
                    color: BaseColors.black_70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
          child: Image.asset(
            getAssetIcons(resId: AssetRes.IC_LOGOUT),
            height: 25,
            width: 25,
            color: BaseColors.white_80,
          ),
          // child: Icon(
          //   Icons.person,
          //   color: Colors.white_80,
          // )),
        ),
        // SpaceLargeWidget(),
        // SpaceLargeWidget(),
      ],
    );
  }

  //----------------------------------------------------------------------------
  @override
  Widget? bottomNavigationBar() {
    return Container(
      height: 70,
      color: Colors.blue,
      child: const Center(
        child: Text(
          "Bottom Navigation Bar..",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  //----------------------------------------------------------------------------
  @override
  Widget errorLayout(String code) {
    return Container(
      height: 150,
      color: Colors.red,
      margin: const EdgeInsets.only(bottom: 15),
    );
  }

  //----------------------------------------------------------------------------
  @override
  Widget loadingLayout() {
    return Container(
      height: 100,
      width: 100,
      color: Colors.yellow,
      child: const Center(
        child: Text("Loading..."),
      ),
    );
  }
//----------------------------------------------------------------------------
}
