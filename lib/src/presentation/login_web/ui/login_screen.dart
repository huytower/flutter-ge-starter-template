
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../base/structure/getx/cc_get_view/cc_get_view.dart';
import '../getx/login_controller.dart';

class LoginPage extends CcGetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key, isEnableAppBar: true);

  @override
  PreferredSizeWidget? appBar() => PreferredSize(child: const SizedBox(), preferredSize: Size.fromHeight(0));

  @override
  Widget? content() => WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: const SizedBox()
      // WebViewRedirect(
      //   url: controller.url,
      //   handlerSuccessResponse: controller.onLoginCallback,
      //   isShowBack: false,
      //   isLogin: true,
      //   // layoutStatus: layoutStatus,
      // ),
      );
}
