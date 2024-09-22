import 'package:cc_library/constant/cc_padding_params.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/util/base_utils.dart';
import 'package:cc_library/util/extension_utils.dart';
import 'package:cc_library/widget/base/cc_position.dart';
import 'package:cc_library/widget/button/cc_back_btn.dart';
import 'package:cc_library/widget/flex/cc_column_start.dart';
import 'package:cc_library/widget/flex/cc_row_start.dart';
import 'package:cc_library/widget/padding/cc_padding.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    this.onTapBack,
    this.onTapAtRightButton,
    this.bgAssetRes,
    required this.iconBackAssetRes,
    this.iconPageAssetRes,
    this.isBackButtonVisible = true,
    this.isRightButtonVisible = false,
    this.title = '',
    this.spaceHeader,
  }) : super(key: key);

  final VoidCallback? onTapBack, onTapAtRightButton;

  final String? bgAssetRes, iconBackAssetRes, iconPageAssetRes;

  final String title;

  final double? spaceHeader;

  final bool isBackButtonVisible, isRightButtonVisible;

  @override
  Widget build(BuildContext context) => getHeaderContainerWidget();

  Widget getBackgroundWidget() => bgAssetRes != null
      ? Image.asset(
          bgAssetRes!,
          height: 120,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        )
      : const SizedBox();

  Widget getDataWidget() => CcColStart(
        children: [
          /// space
          spaceHeader != null
              ? SizedBox(
                  height: spaceHeader,
                )
              : const CcSpaceHeader(),

          /// header
          getHeaderTitleWidget(),
        ],
      );

  /// Header section, included title + space, set aspect ratio para.
  Widget getHeaderContainerWidget() => Stack(
        children: [
          /// Section : Background
          getBackgroundWidget(),

          /// Section : data
          getDataWidget(),
        ],
      );

  Widget getHeaderTitleWidget() => Stack(
        children: [
          /// Section : Icon Page, show at middle side,
          getIconPageWidget(),

          /// Section : Back icon + title page, show at left side
          CcRowStart(
            children: [
              /// space left
              SizedBox(
                width: BaseUtils.isProMaxDeviceType() ? 16.5 : 12.0,
              ),

              /// Section : Back button
              Opacity(
                opacity: isBackButtonVisible ? 1.0 : 0.0,
                child: CcBackAssetBtn(
                  iconBackAssetRes!,
                  onTap: onTapBack!,
                ),
              ),

              /// Section : Title text
              getTitlePageWidget(),
            ],
          ),

          /// Section : Skip button, show at right side
          getRightButtonWidget(),

          /// space right
          SizedBox(
            width: 15.0,
          ),
        ],
      );

  Widget getRightButtonWidget() => onTapAtRightButton != null
      ? Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          child: CcPadding(
              GestureDetector(
                onTap: onTapAtRightButton!,
                behavior: HitTestBehavior.translucent,
                child: SizedBox(
                  width: 103,
                  height: 76,
                  // color: Colors.red,
                  child: Center(
                    child: CcText(
                      'Bỏ qua',
                      color: BaseColors.gray,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      align: Alignment.center,
                    ),
                  ),
                ),
              ),
              0,
              CcPaddingParams.PAGE_LARGE,
              0,
              0))
      : const SizedBox();

  Widget getIconPageWidget() => CcPositionBottom(
        bottom: getSpaceBottom(),
        child: iconPageAssetRes != null ? getImageResWidget(iconPageAssetRes!) : const SizedBox(),
      );

  Widget getImageResWidget(String iconPageAssetRes) => ExtensionUtils.isSvgExtension(iconPageAssetRes)
      ? SvgPicture.asset(
          iconPageAssetRes,
        )
      : Image.asset(
          iconPageAssetRes,
          height: 35.0,
          fit: BoxFit.contain,
        );

  double getSpaceBottom() {
    if (BaseUtils.isProMaxDeviceType()) {
      return 3;
    } else if (BaseUtils.isSmallerThan5InchDeviceType()) {
      return 6;
    } else {
      return 12;
    }
  }

  Widget getTitlePageWidget() => CcText(
        title,
        fontSize: 24.0,
        align: Alignment.center,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w500,
      );
}
