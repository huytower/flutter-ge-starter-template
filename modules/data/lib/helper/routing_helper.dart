import 'dart:async';

import 'package:flutter/material.dart' hide Router;
import 'package:get/get.dart';

class RoutingHelper {
  RoutingHelper._internal();

  static final RoutingHelper instance = RoutingHelper._internal();

  void redirect(BuildContext c, String url, {dynamic arguments}) {
    Get.toNamed(url, arguments: arguments);
  }

  Future push(BuildContext c, String url, {dynamic arguments}) async {
    return Get.toNamed(url, arguments: arguments);
  }

  Future<void> redirectAfterLoginSuccess({Function? onAction}) async {
    String? menu = "/home";

    await onAction?.call();

    return;
  }

  Future<void> logOut(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      Get.toNamed('/logout');
    });
  }
}
