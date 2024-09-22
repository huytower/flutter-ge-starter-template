// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:mobile_flutter_template/src/presentation/base/sample_code/bloc_simple_page/cubit/simple/simple_cubit_page.dart'
    as _i4;
import 'package:mobile_flutter_template/src/presentation/base/sample_code/bloc_simple_page/origin/advance/advance_bloc_page.dart'
    as _i1;
import 'package:mobile_flutter_template/src/presentation/base/sample_code/getx_simple_page/way_1/ui/get_view_page.dart'
    as _i2;
import 'package:mobile_flutter_template/src/presentation/base/sample_code/getx_simple_page/way_2/ui/get_view_v2_view.dart'
    as _i3;
import 'package:mobile_flutter_template/src/presentation/splash/splash_page.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AdvanceBlocRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdvanceBlocPage(),
      );
    },
    GetViewRoute.name: (routeData) {
      final args = routeData.argsAs<GetViewRouteArgs>(
          orElse: () => const GetViewRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.GetViewPage(key: args.key),
      );
    },
    GetViewV2Route.name: (routeData) {
      final args = routeData.argsAs<GetViewV2RouteArgs>(
          orElse: () => const GetViewV2RouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.GetViewV2Page(key: args.key),
      );
    },
    SimpleCubitRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SimpleCubitPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdvanceBlocPage]
class AdvanceBlocRoute extends _i6.PageRouteInfo<void> {
  const AdvanceBlocRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AdvanceBlocRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdvanceBlocRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GetViewPage]
class GetViewRoute extends _i6.PageRouteInfo<GetViewRouteArgs> {
  GetViewRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          GetViewRoute.name,
          args: GetViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'GetViewRoute';

  static const _i6.PageInfo<GetViewRouteArgs> page =
      _i6.PageInfo<GetViewRouteArgs>(name);
}

class GetViewRouteArgs {
  const GetViewRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'GetViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.GetViewV2Page]
class GetViewV2Route extends _i6.PageRouteInfo<GetViewV2RouteArgs> {
  GetViewV2Route({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          GetViewV2Route.name,
          args: GetViewV2RouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'GetViewV2Route';

  static const _i6.PageInfo<GetViewV2RouteArgs> page =
      _i6.PageInfo<GetViewV2RouteArgs>(name);
}

class GetViewV2RouteArgs {
  const GetViewV2RouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'GetViewV2RouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SimpleCubitPage]
class SimpleCubitRoute extends _i6.PageRouteInfo<void> {
  const SimpleCubitRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SimpleCubitRoute.name,
          initialChildren: children,
        );

  static const String name = 'SimpleCubitRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
