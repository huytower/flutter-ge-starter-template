import 'package:app_config/enum/layout_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cc_get_controller/cc_get_controller.dart';

export 'package:cc_library/extension/kotlin_extension.dart';
export 'package:cc_library/extension/logger.dart';

abstract class CcGetView<T extends CcGetController> extends GetView<T> {
  //----------------------------------------------------------------------------
  const CcGetView({
    Key? key,
    this.isEnableAppBar = true,
    this.isEnableBottomNavigation = true,
    this.isEnableTabBar = true,
    this.layoutStatus = LayoutStatus.success,
  }) : super(key: key);

  final bool isEnableAppBar;
  final bool isEnableBottomNavigation;
  final bool isEnableTabBar;
  final LayoutStatus layoutStatus;

  //----------------------------------------------------------------------------
  PreferredSizeWidget? appBar() {
    return _appBarDefault();
  }

  //----------------------------------------------------------------------------
  Widget? content();

  //----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contentLayout(),
      appBar: isEnableAppBar ? appBar() : _appBarDefault(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  //----------------------------------------------------------------------------
  Widget _contentLayout() {
    return Container(
      child: controller.multipleLayoutStates(onLoading: () {
        // if (layoutStatus == LayoutStatus.loadingLayer) {
        //   return Stack(
        //     children: [
        //       content.call() ?? _emptyWidget(),
        //       Container(
        //         color: Colors.red,
        //         height: MediaQuery.of(Get.context!).size.height,
        //         width: MediaQuery.of(Get.context!).size.width,
        //       ),
        //     ],
        //   );
        // }
        return loadingLayout();
      }, onSuccess: () {
        return content.call() ?? _emptyWidget();
      }, onError: (String code) {
        return errorLayout(code);
      }),
    );
  }

  //----------------------------------------------------------------------------
  Widget? bottomNavigationBar() {
    return _emptyWidget();
  }

  //----------------------------------------------------------------------------
  Widget errorLayout(String code) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
      child: Center(
        child: Text(code),
      ),
    );
  }

  //----------------------------------------------------------------------------
  Widget loadingLayout() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.transparent,
      child: const Center(
        child: Text("Loading..."),
      ),
    );
  }

  //----------------------------------------------------------------------------
  PreferredSizeWidget _appBarDefault() {
    return AppBar(
      title: _emptyWidget(),
    );
  }

  //----------------------------------------------------------------------------
  Widget _emptyWidget() {
    return const SizedBox.shrink();
  }
}
