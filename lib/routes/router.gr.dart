// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../cabinet/cabinet.dart' as _i2;
import '../home.dart' as _i6;
import '../home_page.dart' as _i1;
import '../inf/inf.dart' as _i3;
import '../modules/modules.dart' as _i4;
import '../stat/stat.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    CabinetRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Cabinet(),
      );
    },
    InfRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.InF(),
      );
    },
    ModulesRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.Modules(),
      );
    },
    StatRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.Stat(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.Home(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              CabinetRouter.name,
              path: 'cabinet',
              parent: HomeRoute.name,
            ),
            _i7.RouteConfig(
              InfRouter.name,
              path: 'inf',
              parent: HomeRoute.name,
            ),
            _i7.RouteConfig(
              ModulesRouter.name,
              path: 'modules',
              parent: HomeRoute.name,
            ),
            _i7.RouteConfig(
              StatRouter.name,
              path: 'stat',
              parent: HomeRoute.name,
            ),
            _i7.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: HomeRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.Cabinet]
class CabinetRouter extends _i7.PageRouteInfo<void> {
  const CabinetRouter()
      : super(
          CabinetRouter.name,
          path: 'cabinet',
        );

  static const String name = 'CabinetRouter';
}

/// generated route for
/// [_i3.InF]
class InfRouter extends _i7.PageRouteInfo<void> {
  const InfRouter()
      : super(
          InfRouter.name,
          path: 'inf',
        );

  static const String name = 'InfRouter';
}

/// generated route for
/// [_i4.Modules]
class ModulesRouter extends _i7.PageRouteInfo<void> {
  const ModulesRouter()
      : super(
          ModulesRouter.name,
          path: 'modules',
        );

  static const String name = 'ModulesRouter';
}

/// generated route for
/// [_i5.Stat]
class StatRouter extends _i7.PageRouteInfo<void> {
  const StatRouter()
      : super(
          StatRouter.name,
          path: 'stat',
        );

  static const String name = 'StatRouter';
}

/// generated route for
/// [_i6.Home]
class HomeRouter extends _i7.PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: 'home',
        );

  static const String name = 'HomeRouter';
}
