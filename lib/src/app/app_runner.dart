import 'package:app_config/config/app_config/cc_app_config.dart';
import 'package:app_config/config/device_info/cc_device_info.dart';
import 'package:app_config/enum/routing_manager_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:theme/cc_themes.dart';
import 'package:widget/export/cc_ktx_export.dart';

import '../core/di/inject/app_inject.dart';
import '../core/extension/app_tracking_log_extension.dart';
import '../core/routing_management/enum/page_name_enum.dart';
import '../core/routing_management/main_routing.dart';
import '../core/routing_management/way_1/routing_manager.dart';
import '../core/routing_management/way_2/getx_routing_manager.dart';
import 'app_runner_impl.dart';

class AppRunner extends StatefulWidget {
  const AppRunner({Key? key}) : super(key: key);

  @override
  State<AppRunner> createState() => AppRunnerState();
}

class AppRunnerState extends State<AppRunner> with AppRunnerImpl {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();

    'API Environment = ${CcAppConfig.environment}'.Log();
    'Routing Management = ${CcAppRoutingManager.defaultRoutingManager}'.Log();

    onInitState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceInfo = getIt<CcDeviceInfo>();

    deviceInfo
      ..deviceHeight = MediaQuery.of(context).size.height
      ..deviceWidth = MediaQuery.of(context).size.width;

    if (deviceInfo.deviceHeight == null || deviceInfo.deviceWidth == null) {
      'Error : somehow it can not get device resolution'.Log().addAppTrackingLog();

      return const SizedBox();
    }

    return buildBody();
  }

  Widget buildBody() => when(variable: CcAppRoutingManager.defaultRoutingManager, conditions: {
        RoutingManagerEnum.AUTO_ROUTE: () => buildAutoRoute(),
        RoutingManagerEnum.GETX: () => buildGetxRoute(),
      });

  MaterialApp buildAutoRoute() => MaterialApp.router(
        routerConfig: _appRouter.config(),
      );

  GetMaterialApp buildGetxRoute() {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CcThemes.darkTheme,
      initialRoute: getPageName(PageNameEnum.SPLASH),
      getPages: GetxRoutingManager.instance.getPages(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
      ],
    );
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
}
