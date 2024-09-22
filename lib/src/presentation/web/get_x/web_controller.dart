import 'dart:ui';

import 'package:app_config/enum/layout_status.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/di/inject/app_inject.dart';
import '../../base/structure/getx/cc_get_controller/cc_get_controller.dart';
import '../../base/structure/getx/cc_get_view/cc_get_view.dart';

class WebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => getIt<WebController>());
  }
}

// @singleton
class WebController extends CcGetController {
  var webViewController;

  @override
  void onInit() {
    super.onInit();
    'onInit(): '.Log();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));

    layoutStatus.value = LayoutStatus.success;
  }
}
