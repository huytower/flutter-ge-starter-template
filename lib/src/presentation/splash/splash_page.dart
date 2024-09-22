import 'package:auto_route/auto_route.dart';
import 'package:cc_library/export/kotlin_extension.dart';
import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:app_config/constant/assets_resource.dart';
import 'package:app_config/enum/routing_manager_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routing_management/enum/page_name_enum.dart';
import '../../core/routing_management/main_routing.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    final func = () {
      when(variable: CcAppRoutingManager.defaultRoutingManager, conditions: {
        RoutingManagerEnum.AUTO_ROUTE: () =>
            AutoRouter.of(context).replaceNamed(getPageNameInternal(PageNameInternalEnum.BLOC_ADVANCE)),
        RoutingManagerEnum.GETX: () => Get.offAndToNamed(getPageNameInternal(PageNameInternalEnum.GETX_SIMPLE)),
      });
    };

    Future.delayed(const Duration(milliseconds: 200)).then((value) => func());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                getAssetBackground(resId: AssetResSplash.BG_SPLASH),
              ),
            ),
          ),
        ),
      );
}
