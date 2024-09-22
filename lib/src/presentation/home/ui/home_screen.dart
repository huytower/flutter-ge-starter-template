import 'package:cc_library/constant/cc_padding_params.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/base/cc_scroll_view.dart';
import 'package:cc_library/widget/divider_line/cc_divider.dart';
import 'package:cc_library/widget/flex/cc_column_center.dart';
import 'package:cc_library/widget/flex/cc_row_between.dart';
import 'package:cc_library/widget/flex/cc_row_start.dart';
import 'package:cc_library/widget/padding/cc_padding.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:app_config/constant/assets_resource.dart';
import 'package:app_config/enum/cc_vpn_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_template/src/presentation/home/ui/switch/animated_switch.dart';
import 'package:mobile_flutter_template/src/presentation/home/ui/user_info_widget.dart';
import 'package:widget/export/cc_ui_export.dart';

import '../../base/structure/getx/cc_get_view/cc_get_view.dart';
import '../../login_web/getx/login_controller.dart';
import '../get_x/home_controller.dart';
import '../mixin/home_provider.dart';

class HomePage extends CcGetView<HomeController> with HomeProvider {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget? bottomNavigationBar() => const SizedBox();

  Widget buildContainer() {
    if (!controller.initialized) {
      return const SizedBox();
    }

    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.white,
      child: CcScrollView(
          child: CcPadding(
        CcColCenter(children: [
          /// User title
          const UserInfoWidget(
            isProfilePage: true,
          ),

          const CcSpaceSmall(),
          CcDividerLine(
            color: BaseColors.black_5,
          ),
          const CcSpaceSmall(),

          buildVpnContainer(),

          const CcSpaceSmall(),
          CcDividerLine(
            color: BaseColors.black_5,
          ),
          const CcSpaceSmall(),

          buildFeatures(),
          const CcSpaceSmall(),
          modeTest()
        ]),
        0,
        15,
        15,
        15,
      )),
    );
  }

  Widget modeTest() {
    return Container(
      height: 150,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      color: Colors.blue,
      child: Obx(
        () {
          return Visibility(
            visible: true,
            child: Text(
              "toggle status: ${controller.vpnBtnStatusValue}\nvpn status : ",
              // "toggle status: ${controller.vpnBtnStatusValue}\nvpn status : ${controller.vpnStage.value}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }

  CcRowStart buildExplainLine(IconData icon, String title) {
    return CcRowStart(children: [
      const CcSpaceLarge(),
      Icon(
        icon,
        color: Colors.grey,
      ),
      const CcSpaceSmall(),
      const CcSpaceSmall(),
      Expanded(
        child: CcText(
          title,
          textStyle: CcTextStyle.bodyText1.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ]);
  }

  Widget buildFeatures() =>
      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CcSpaceLarge(),
        CcText('Features',
            textStyle: CcTextStyle.bodyText1.copyWith(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.w600)),
        const CcSpaceLarge(),
        const CcSpaceLarge(),
        buildFeature(),
      ]);

  Widget buildFeature() => CcPadding(
      Container(
        width: 90,
        height: 90,
        child: CcColCenter(children: [
          GestureDetector(
            onTap: () => controller.onTapAccessWebInfo(),
            child: Image.asset(
              getAssetIcons(resId: AssetRes.IC_ANALYTICS),
              width: 48,
            ),
          ),
          const CcSpaceLarge(),
          CcText(
            'Dashboard',
            textStyle: CcTextStyle.bodyText1.copyWith(color: BaseColors.black_50, fontSize: 13),
            align: Alignment.center,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ]),
      ),
      0,
      CcPaddingParams.PAGE_MID,
      0,
      0);

  Widget buildSwitchBtn() => Obx(() => AnimatedSwitch(
        key: controller.keySwitch,
        vpnBtnStatus: controller.vpnBtnStatusValue,
        isEnable: true,
        onToggleCallback: (status) => controller.onToggleSwitch(status),
      ));

  Container buildVpnContainer() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CcSpaceLarge(),
          buildVpnStatus(),
          const CcSpaceLarge(),
          buildVpnInfo(),
          const CcSpaceLarge(),
        ],
      ),
    );
  }

  Row buildVpnInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        buildSwitchBtn(),
        const CcSpaceLarge(),
        const CcSpaceSmall(),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CcText(
                "Compnay VPN Profile :",
                textStyle: CcTextStyle.bodyText1.copyWith(
                  color: BaseColors.black_20,
                ),
              ),
              const CcSpaceSmall(),
              Obx(() {
                // var isError = false;
                var isError = controller.isVpnConfigValid.value == false;
                var content = VpnDataObject.vpnUrl.value;
                var list = content.split("/");
                var error = "The profile is invalid.";

                if (!isError) {
                  if (list.isEmpty) {
                    content = "Profile error.";
                  }
                }

                if (!list.contains('/')) {
                  list = content.split('/');
                }

                return CcText(
                  isError ? error : "${list.last.replaceAll(".ovpn", "")}",
                  textStyle: CcTextStyle.bodyText1.copyWith(color: isError ? Colors.red : null, fontSize: 16),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                );
              })
            ],
          ),
        )
      ],
    );
  }

  Widget buildVpnStatus() {
    return CcRowBetween(
      children: [
        CcText(
          'VPN Status',
          textStyle: CcTextStyle.bodyText1.copyWith(
            color: Colors.blue,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            // overflow: TextOverflow.ellipsis,
          ),
        ),
        Obx(() {
          var title = "DISCONNECTED";
          var colors = BaseColors.black_20;
          when(variable: controller.vpnBtnStatusValue, conditions: {
            CcVpnBtnStatus.UNSELECT: () {
              title = "DISCONNECTED";
              colors = BaseColors.black_20;
            },
            CcVpnBtnStatus.LOADING: () {
              title = "DISCONNECTED";
              colors = BaseColors.black_20;
            },
            CcVpnBtnStatus.SELECTED: () {
              title = "CONNECTED";
              colors = Colors.lightGreen;
            },
          });

          return CcText(
            title,
            textStyle: CcTextStyle.bodyText1.copyWith(
              color: colors,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              // overflow: TextOverflow.ellipsis,
            ),
          );
        }),
      ],
    );
  }

  @override
  Widget? content() => WillPopScope(
      onWillPop: () async => true,
      child: Stack(
        children: [
          /// hidden view
          Obx(() => Opacity(
                opacity: 0,
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.pink,
                  child: const SizedBox(),
                ),
              )),
          buildContainer(),
        ],
      ));

  @override
  Widget loadingLayout() => Center(
          child: CircularProgressIndicator(
        color: BaseColors.black_40,
      ));
}
