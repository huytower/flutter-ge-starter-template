import 'package:cc_library/widget/container/cc_container_rect.dart';
import 'package:cc_library/widget/icon/cc_icon.dart';
import 'package:cc_library/widget/inkwell/button_inkwell_widget.dart';
import 'package:cc_library/widget/inkwell/inkwell_click.dart';
import 'package:cc_library/widget/padding/cc_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CcBackBtn extends StatelessWidget {
  const CcBackBtn({Key? key, required this.onPress, required this.icon}) : super(key: key);

  final VoidCallback onPress;
  final IconData icon;

  @override
  Widget build(c) => CcPadding(
      Stack(
        children: [
          CcIcon(
            icon: icon,
            size: 20,
            align: Alignment.center,
            color: Colors.white,
          ),
          InkWellClick(
            onTap: onPress,
          ),
        ],
      ),
      4,
      4,
      4,
      4);
}

/// use *.svg only
class CcBackAssetBtn extends StatelessWidget {
  const CcBackAssetBtn(this.assetRes, {Key? key, this.onTap, this.aspectRatio = 16 / 9}) : super(key: key);

  final onTap;

  final String assetRes;

  final double aspectRatio;

  @override
  Widget build(c) => ButtonInkWellCircleWidget(
        onTap: onTap,
        child: SizedBox(
          height: 45.0,
          width: 45.0,
          child: Center(
            child: SvgPicture.asset(
              assetRes,
              height: 22.0,
              width: 22.0,
            ),
          ),
        ),
      );
}

class CcBackDividerBtn extends StatelessWidget {
  const CcBackDividerBtn({Key? key, @required this.onPress}) : super(key: key);

  final double heightBack = 5, widthBack = 36, paddingBack = 14;

  final onPress;

  @override
  Widget build(c) => Positioned(
        left: Get.width / 2 - widthBack / 2,
        top: paddingBack,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: paddingBack),
              child: ContainerRectWidget(
                bgColor: Colors.white,
                width: widthBack,
                height: heightBack,
                widget: Container(),
              ),
            ),
            InkWellClick(
              onTap: () => onPress(),
            )
          ],
        ),
      );
}
