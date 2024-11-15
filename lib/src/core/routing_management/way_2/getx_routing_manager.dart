import 'package:get/get.dart';

import '../../../presentation/home/get_x/home_controller.dart';
import '../../../presentation/home/ui/home_screen.dart';
import '../../../presentation/login_web/getx/login_controller.dart';
import '../../../presentation/login_web/ui/login_page.dart';
import '../../../presentation/login_web/ui/login_screen.dart';
import '../../../presentation/base/sample_code/bloc_simple_page/cubit/simple/simple_cubit_page.dart';
import '../../../presentation/base/sample_code/getx_simple_page/way_1/getx/get_view_controller.dart';
import '../../../presentation/base/sample_code/getx_simple_page/way_1/ui/get_view_page.dart';
import '../../../presentation/base/sample_code/getx_simple_page/way_2/getx/get_view_v2_binding.dart';
import '../../../presentation/base/sample_code/getx_simple_page/way_2/ui/get_view_v2_view.dart';
import '../../../presentation/splash/splash_page.dart';
import '../../../presentation/web/get_x/web_controller.dart';
import '../../../presentation/web/ui/web_page.dart';
import '../enum/page_name_enum.dart';
import '../main_routing.dart';

/// GETX|BLOC : Routing management
/// Step 3 : declare routing screen||page
///
class GetxRoutingManager {
  /// Instance
  GetxRoutingManager._private();

  static final GetxRoutingManager instance = GetxRoutingManager._private();

  List<GetPage> getPages() {
    return [
      GetPage(
        name: getPageName(PageNameEnum.INTRO),
        page: () => LoginPageDemo(),
      ),
      GetPage(
        name: getPageName(PageNameEnum.SPLASH),
        page: () => const SplashPage(),
      ),
      GetPage(
        name: getPageName(PageNameEnum.HOME),
        page: () => HomePage(),
        binding: HomeBinding(),
      ),
      GetPage(
          name: getPageName(PageNameEnum.LOGIN),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          binding: LoginBinding(),
          page: () => const LoginPage()),
      GetPage(
          name: getPageName(PageNameEnum.WEB),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          binding: WebBinding(),
          page: () => const WebPage()),

      /// CORE PAGE
      GetPage(
          name: getPageNameInternal(PageNameInternalEnum.CUBIT_SIMPLE),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          page: () => const SimpleCubitPage()),
      GetPage(
          name: getPageNameInternal(PageNameInternalEnum.GETX_SIMPLE),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          binding: GetViewBinding(),
          page: () => GetViewPage()),
      GetPage(
          name: getPageNameInternal(PageNameInternalEnum.GETX_SIMPLE_V2),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          binding: GetViewV2Binding(),
          page: () => GetViewV2Page()),
    ];
  }
}
