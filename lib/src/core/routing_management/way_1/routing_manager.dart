import 'package:auto_route/auto_route.dart';

import '../enum/page_name_enum.dart';
import '../main_routing.dart';
import 'routing_manager.gr.dart';

/// RECOMMEND WAY for routing management in app
/// - simple
/// - trending
/// - auto-generated code
/// - tracking via page name
/// ...
/// NOTICE : default page name suffix = 'Page', then convert to 'Route',
/// otherwise auto-generated wrong code
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true,
        ),
    AutoRoute(
      page: SimpleCubitRoute.page,
      path: getPageNameInternal(PageNameInternalEnum.BLOC_SIMPLE),
    ),
    AutoRoute(
      page: AdvanceBlocRoute.page,
      path: getPageNameInternal(PageNameInternalEnum.BLOC_ADVANCE),
    ),
    AutoRoute(
      page: GetViewRoute.page,
      path: getPageNameInternal(PageNameInternalEnum.GETX_SIMPLE),
    ),
    AutoRoute(
      page: GetViewV2Route.page,
      path: getPageNameInternal(PageNameInternalEnum.GETX_SIMPLE_V2),
    ),
      ];
}
