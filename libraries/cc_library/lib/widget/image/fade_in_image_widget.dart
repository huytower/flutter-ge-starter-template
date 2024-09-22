import 'package:cc_library/constant/cc_constants_multimedia.dart';
import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Customize Image widget, params :
/// - placeHolder : default image inside /asset folder
/// - image : thumbnail image url, loading via internet
class FadeInAssetWidget extends StatelessWidget {
  const FadeInAssetWidget(
      {Key? key,
      this.isVideo = false,
      required this.placeholder,
      this.image,
      this.width = 20.0,
      this.hasBorder = true,
      this.hasBorderLine = true,
      this.boxFit})
      : super(key: key);

  final bool isVideo;

  final bool hasBorder, hasBorderLine;

  final String placeholder;
  final String? image;

  final double width;

  final BoxFit? boxFit;

  @override
  Widget build(c) => Container(
        decoration: BoxDecoration(
          color: BaseColors.black_5,
          borderRadius: WidgetHelper.getBorderRoundedSmall(),
        ),
        width: width,
        height: !isVideo ? width : (width * 9 / 16),
        child: AspectRatio(
          // Aspect ratio must set to show it on UI, Video|Song aspect ratio
          aspectRatio:
              isVideo ? CcConstantsMultimedia.aspectRatioVideoThumb : CcConstantsMultimedia.aspectRatioSongThumb,
          child: ClipRRect(
            borderRadius: hasBorder ? WidgetHelper.getBorderRoundedSmall() : BorderRadius.zero,
            child: image != null && image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: placeholder,
                    image: image!,
                    fit: boxFit ?? BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 200),
                    fadeOutDuration: const Duration(milliseconds: 200),
                  )
                : Image.asset(
                    placeholder,
                    fit: BoxFit.fill,
                  ),
          ),
        ),
      );
}

/// Customize Image widget, params :
/// - placeHolder : default image inside /asset folder
/// - image : thumbnail image url, loading via internet
/// in circle fit
class FadeInAssetCircleWidget extends StatelessWidget {
  const FadeInAssetCircleWidget({
    Key? key,
    required this.placeholder,
    required this.image,
    required this.width,
    required this.hasBorder,
    required this.hasBorderLine,
  }) : super(key: key);

  final bool hasBorder, hasBorderLine;

  final placeholder;
  final String image;

  final double width;

  @override
  Widget build(c) => Center(
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: BaseColors.white_10, width: hasBorderLine ? 1.0 : 0.0)),
          width: width,
          height: width,
          child: AspectRatio(
            aspectRatio: CcConstantsMultimedia.aspectRatioSongThumb,
            child: ClipRRect(
              borderRadius: WidgetHelper.getCircleBorderRadius(),
              child: image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: placeholder,
                      image: image,
                      fit: BoxFit.contain,
                      fadeInDuration: const Duration(milliseconds: 200),
                      fadeOutDuration: const Duration(milliseconds: 200),
                    )
                  : Image.asset(
                      placeholder,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ),
      );
}
