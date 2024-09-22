import 'package:cc_library/helper/widget_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/export/cc_ui_export.dart';

class PageError extends StatelessWidget {
  final Function onTapReload;
  final String? assetIcon;

  const PageError({Key? key, required this.onTapReload, this.assetIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: GestureDetector(
          onTap: () {
            onTapReload.call();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Get.width - 50,
                width: Get.width - 50,
                decoration: BoxDecoration(border: Border.all(color: PrjColorsSimple.gray, width: 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(assetIcon!, width: 100, fit: BoxFit.fitWidth),
                    const SizedBox(height: 15),
                    Text("Đã xảy ra lỗi",
                        style: WidgetHelper.getTextStyleRoboto(fontSize: 20, color: PrjColors.black.withOpacity(0.7))),
                    const SizedBox(height: 10),
                    Text("Nhấn vào đây để tải lại",
                        style: WidgetHelper.getTextStyleRoboto(fontSize: 20, color: PrjColors.black.withOpacity(0.7)))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
