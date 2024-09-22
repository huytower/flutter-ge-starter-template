
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/flex/cc_column_center.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:app_config/config/app_config/api_env/app_config_prod.dart';
import 'package:app_config/config/app_config/api_env/app_config_uat.dart';
import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:app_config/config/setting_device/setting_device.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget/export/cc_ui_export.dart';

import '../../login_web/getx/login_controller.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key, this.isProfilePage = false}) : super(key: key);

  final bool isProfilePage;

  @override
  Widget build(BuildContext context) => buildContainer();

  Container buildContainer() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      child: Row(
        children: [
          const CcSpaceSmall(),

          /// Section : Avatar
          buildUserAvatar(),

          CcSpaceLarge(),

          /// Section : User info
          buildUserText(),

          const CcSpaceSmall(),
        ],
      ),
    );
  }

  CcText buildDesText(String? des) => CcText(
        des ?? '',
        textStyle: CcTextStyle.bodyText1,
        maxLines: 2,
      );

  SizedBox buildUserAvatar() {
    return const SizedBox(
      height: 70,
      width: 70,
      child: CircleAvatar(),
    );
  }

  Expanded buildUserText() {
    return Expanded(
      child: CcColCenter(
        children: [
          /// Section : Full name
          CcText(
            user.fullname?.toString(),
            textStyle: GoogleFonts.roboto(
              color: PrjColors.black14c111111,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
          ),

          const CcSpaceSmall(),

          /// Section : Department name
          user.departmentName == null || user.storeID != 30
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 5),
                  child: buildDesText(user.departmentName),
                ),
          user.positionName == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: CcText(
                    user.positionName,
                    textStyle: GoogleFonts.roboto(
                      color: BaseColors.black_30,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                  ),
                ),

          /// Section : Store name
          // user.storeName == null || !isProfilePage
          //     ? const SizedBox()
          //     : Padding(
          //         padding: const EdgeInsets.only(bottom: 5),
          //         child: buildDesText(user.storeName),
          //       ),

          /// Section : Version name
          // showVersion(),
        ],
      ),
    );
  }

  /// Show correct app version
  Widget showVersion() {
    if (!isProfilePage) {
      return const SizedBox();
    }
    String env = "";
    if (CcAppConfig.instance is AppConfigProd) {
      env = "";
    } else if (CcAppConfig.instance is AppConfigUat) {
      env = "Uat";
    }
    String version =
        "Ver 1.0.${SettingDevice.isIOS ? CcAppConfig.instance.versionIOS : CcAppConfig.instance.versionAndroid} $env";
    return buildDesText(version);
  }
}
