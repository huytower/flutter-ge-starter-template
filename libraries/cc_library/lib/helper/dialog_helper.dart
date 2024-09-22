import 'dart:async';

import 'package:cc_library/widget/page/ignore_keyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionHelper {
  static Future<dynamic> ctmShowDialog({required BuildContext context, String title = "", String message = ""}) async {
    bool rs = false;
    await showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: CupertinoTheme(
                data: const CupertinoThemeData(
                  brightness: Brightness.light,
                ),
                child: CupertinoAlertDialog(
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(
                          message,
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        rs = false;
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.transparent, shadowColor: Colors.transparent),
                      child: Text(
                        'Cancel',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        rs = true;
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.transparent, shadowColor: Colors.transparent),
                      child: Text(
                        'OK',
                      ),
                    ),
                  ],
                ),
              ));
        });
    return rs;
  }

  static Future<dynamic> ctmListShowDialog(
      {required BuildContext context, String title = "", List<Widget>? listChooses}) async {
    bool rs = false;
    await showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: CupertinoTheme(
                data: const CupertinoThemeData(
                  brightness: Brightness.light,
                ),
                child: CupertinoAlertDialog(
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[...listChooses!],
                    ),
                  ),
                ),
              ));
        });
    return rs;
  }

  static Future<dynamic> ctmShowDialogCustom({required BuildContext context, String title = "", Widget? child}) async {
    bool rs = false;
    await showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return WillPopScope(onWillPop: () async => true, child: child!);
        });
    return rs;
  }

  static Future<dynamic> ctmShowModalBottomSheet(
    BuildContext contextReq,
    Widget w, {
    bool isHasIgnore = false,
    bool enableDrag = true,
    double? heightModal,
    double border = 10.0,
  }) {
    var promise = Completer();
    showModalBottomSheet(
      enableDrag: enableDrag,
      isDismissible: enableDrag,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(border))),
      backgroundColor: Colors.white,
      context: contextReq,
      isScrollControlled: true,
      builder: (context) {
        if (isHasIgnore) {
          return BodyModalBottomSheet(
            w: w,
          );
        }
        return IgnoreKeyboard(
          child: BodyModalBottomSheet(
            w: w,
          ),
        );
      },
    ).then((x) {
      if (x == null) {
        return promise.complete(x);
      }
      return promise.complete(x);
    });
    return promise.future;
  }

  Future<dynamic> ctmShowModalBottomSheetV2(
    BuildContext contextReq,
    Widget w, {
    bool isHasIgnore = false,
    bool enableDrag = true,
    double? heightModal,
  }) {
    var promise = Completer();
    showModalBottomSheet(
      enableDrag: enableDrag,
      isDismissible: enableDrag,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      backgroundColor: Colors.white,
      context: contextReq,
      isScrollControlled: true,
      builder: (context) {
        if (isHasIgnore) {
          return BodyModalBottomSheetV2(
            w: w,
          );
        }
        return IgnoreKeyboard(
          child: BodyModalBottomSheetV2(
            w: w,
          ),
        );
      },
    ).then((x) {
      if (x == null) {
        return promise.complete({});
      }
      return promise.complete(x);
    });
    return promise.future;
  }
}

class BodyModalBottomSheetV2 extends StatelessWidget {
  final Widget? w;

  const BodyModalBottomSheetV2({Key? key, this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double heightKeyboard = MediaQuery.of(context).viewInsets.bottom;
    // double heightKeyboard = SettingDevice.getHeightKeyBoard();//MediaQuery.of(context).viewInsets.bottom
    return Container(
      // padding: EdgeInsets.only(
      //   bottom: heightKeyboard,
      // ),
      child: w,
    );
  }
}

class BodyModalBottomSheet extends StatelessWidget {
  final Widget? w;

  const BodyModalBottomSheet({Key? key, this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double heightKeyboard = MediaQuery.of(context).viewInsets.bottom;
    // double heightKeyboard = SettingDevice.getHeightKeyBoard();//MediaQuery.of(context).viewInsets.bottom

    return SingleChildScrollView(
      child: Container(
        // padding: EdgeInsets.only(
        //   bottom: heightKeyboard,
        // ),
        child: w,
      ),
    );
  }
}
