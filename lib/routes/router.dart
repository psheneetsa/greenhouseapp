import 'package:greenhouseapp/home.dart';
import 'package:auto_route/auto_route.dart';
import 'package:greenhouseapp/cabinet/cabinet.dart';
import 'package:greenhouseapp/home_page.dart';
import 'package:greenhouseapp/inf/inf.dart';
import 'package:greenhouseapp/modules/modules.dart';
import 'package:greenhouseapp/stat/stat.dart';
import 'package:greenhouseapp/routes/router.gr.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'cabinet',
          name: 'CabinetRouter',
          page: Cabinet,
        ),
        AutoRoute(
          path: 'inf',
          name: 'InfRouter',
          page: InF,
        ),
        AutoRoute(
          path: 'modules',
          name: 'ModulesRouter',
          page: Modules,
        ),
        AutoRoute(
          path: 'stat',
          name: 'StatRouter',
          page: Stat,
        ),
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: Home,
        ),
      ],
    ),
  ],
)
class $AppRouter {}