import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/widget/container/cc_container_circle.dart';
import 'package:app_config/config/app_storage/cc_app_storage.dart';
import 'package:app_config/constant/assets_resource.dart';
import 'package:flutter/material.dart';

class AvatarUser extends StatelessWidget {
  final double width;

  const AvatarUser({Key? key, this.width = 50}) : super(key: key);

  final String pathDefault = 'packages/theme/assets/logos/ic_default_user_avatar.png';

  @override
  Widget build(BuildContext context) {
    if (CcAppStorage.instance.user == null) {
      return const SizedBox();
    }

    if (CcAppStorage.instance.user!.avatarFail == pathDefault) {
      return ClipOval(
        child: Container(
          height: width,
          width: width,
          child: buildImageDefault(),
        ),
      );
    }
    String imageUrl = "";
    // "${CcAppConfig.instance.urlGetAvatarEmployees}${CcAppStorage.instance.user!.avatar}";

    return buildAvatarContainer(imageUrl);
  }

  Widget buildAvatarContainer(String imageUrl) {
    return CcContainerCircle(
      bgColor: Colors.transparent,
      strokeColor: Colors.transparent,
      strokeWidth: 2,
      child: buildCircleContainer(imageUrl),
    );
  }

  // Widget buildAvatarRes(String imageUrl) {
  //   return CachedNetworkImage(
  //     imageUrl: imageUrl,
  //     placeholder: (context, url) => buildImageDefault(),
  //     errorWidget: (context, url, error) => buildImageDefaultError(),
  //     width: width,
  //     height: width,
  //     fit: BoxFit.fill,
  //     filterQuality: FilterQuality.high,
  //   );
  // }

  ClipOval buildCircleContainer(String imageUrl) {
    return ClipOval(
      child: Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: WidgetHelper.getCircleBorderRadius(),
        ),
        // child: buildAvatarRes(imageUrl),
      ),
    );
  }

  Image buildImageDefault() {
    return Image.asset(getAssetIcons(resId: AssetRes.IC_AVATAR_DEFAULT));
  }

  Image buildImageDefaultError() {
    CcAppStorage.instance.user!.avatarFail = pathDefault;
    return Image.asset(getAssetIcons(resId: AssetRes.IC_AVATAR_DEFAULT));
  }
}
