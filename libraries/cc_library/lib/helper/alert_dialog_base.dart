import 'package:flutter/material.dart';

enum MODE_ALERT_DIALOG { center, bottom, top }

/// *[content] a content view with height a infinity.
/// *[percent] a percent height dialog, no required.
class AlertDialogBase<T> {
  final BuildContext context;
  final Widget content;
  final MODE_ALERT_DIALOG mode;
  final bool isDismissTouchOutside;
  final bool isFullScreen;
  final Function<T>(T data)? onResult;
  final BorderRadius? borderRadius;

  bool isShow = false;
  double? percent;

  AlertDialogBase(
      {required this.context,
      required this.content,
      this.percent,
      this.mode = MODE_ALERT_DIALOG.center,
      this.isDismissTouchOutside = true,
      this.isFullScreen = false,
      this.onResult,
      this.borderRadius})
      : assert((percent == null) || (percent > 0) && (percent <= 1));

  void dismiss() {
    if (isShow == true) {
      isShow = false;
      Navigator.of(context).pop();
    }
  }

  Future show() async {
    isShow = true;
    if (percent == null) {
      if (isFullScreen == true) {
        percent = 1;
      } else {
        percent = 0.96;
      }
    }
    showDialog<T>(
      context: context,
      barrierDismissible: isDismissTouchOutside == true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(
            horizontal: isFullScreen ? 0 : MediaQuery.of(context).size.width * ((1 - (percent ?? 0.0))),
          ),
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: handleContentWithMode(),
        );
      },
    ).then((value) {
      onResult?.call(value);
    });
  }

  Widget getContentWithBorder() {
    var newPadding = MediaQuery.of(context).size.width * (((1 - (percent ?? 0.0)) / 2));
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        child: content,
      ),
      padding: EdgeInsets.only(left: newPadding, right: newPadding),
      color: Colors.transparent,
    );
  }

  //link_management
  Widget handleContentWithMode() {
    switch (mode) {
      case MODE_ALERT_DIALOG.center:
        return getContentWithBorder();
      case MODE_ALERT_DIALOG.bottom:
        return contentBottom();
      case MODE_ALERT_DIALOG.top:
        return contentTop();
      default:
        return getContentWithBorder();
    }
  }

  Widget contentBottom() {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.centerLeft,
            ),
            onTap: () {
              dismiss();
            },
          ),
          flex: 1,
        ),
        getContentWithBorder(),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  Widget contentTop() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        getContentWithBorder(),
        Expanded(
          child: InkWell(
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.centerLeft,
            ),
            onTap: () {
              dismiss();
            },
          ),
          flex: 1,
        ),
      ],
    );
  }
}
