import 'package:core_package/generated/core_translation/core_translations.dart';
import 'package:dalil_hama/routing/observer_utils.dart';
import 'package:dalil_hama/routing/route_info.dart';
import 'package:dalil_hama/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/core/presentation/page/splash_page.dart';
import 'generated/translation/translations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        ...Translations.localizationsDelegates,
        ...CoreTranslations.localizationsDelegates,
      ],
      locale: Locale('ar'),
      supportedLocales: const [
        ...Translations.supportedLocales,
        ...CoreTranslations.supportedLocales,
      ],
      debugShowCheckedModeBanner: false,
      routerConfig: goRouterConfig,
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter goRouterConfig = GoRouter(
  observers: [ObserverUtils.routeObserver],
  initialLocation: SplashPage.path,
  navigatorKey: _rootNavigatorKey,
  routes: _getRoutes(Routes.I.routes),
);

List<RouteBase> _getRoutes(List<RouteInfo>? routes) => (routes ?? []).map((
  subRoute,
) {
  if (subRoute.type == RouteType.shell) {
    return ShellRoute(
      builder: (context, state, child) =>
          subRoute.builder(context, state, child),
      routes: _getRoutes(subRoute.routes),
    );
  }
  return GoRoute(
    parentNavigatorKey: subRoute.useRootNavigator ? _rootNavigatorKey : null,
    path: subRoute.path!,
    name: subRoute.name ?? subRoute.path,
    builder: (context, state) => subRoute.builder(context, state, null),
    routes: _getRoutes(subRoute.routes),
    // pageBuilder: tabs.contains(subRoute.path)
    //     ? (context, state) =>
    //     NoTransitionPage(child: subRoute.builder(context, state, null))
    //     : null,
  );
}).toList();
