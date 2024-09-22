import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_it/watch_it.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../base/structure/getx/cc_get_view/cc_get_view.dart';
import '../get_x/web_controller.dart';
import '../mixin/web_provider.dart';

class WebPage extends CcGetView<WebController>
    with WebRedirectProvider, WatchItMixin {
  const WebPage({Key? key}) : super(key: key, isEnableAppBar: true);

  @override
  Widget? bottomNavigationBar() => const SizedBox();

  @override
  Widget errorLayout(String code) => const SizedBox();

  @override
  Widget loadingLayout() => const SizedBox();

  //----------------------------------------------------------------------------
  @override
  Widget? content() => SafeArea(
        top: false,
        bottom: false,
        minimum: EdgeInsets.only(bottom: Get.mediaQuery.padding.bottom),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: buildWebView(),
        ),
      );

  Widget buildWebView() => Stack(children: [
        WebViewWidget(controller: controller.webViewController),
      ]);
}
