import 'package:dalil_hama/features/core/presentation/page/core_page.dart';
import 'package:dalil_hama/features/core/presentation/page/settings_page.dart';
import 'package:dalil_hama/features/core/presentation/page/splash_page.dart';
import 'package:dalil_hama/features/home/presentation/page/home_page.dart';
import 'package:dalil_hama/features/map/presentation/map_page.dart';
import 'package:dalil_hama/features/post/presentation/post_favourite_page.dart';
import 'package:dalil_hama/routing/route_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class Routes {
  Routes._();

  static Routes I = Routes._();

  final List<RouteInfo> routes = [
    RouteInfo(
      builder: (context, state, child) => SplashPage(),
      path: SplashPage.path,
    ),
    RouteInfo(
      builder: (context, state, child) => CorePage(child: child!),
      type: RouteType.shell,
      path: CorePage.path,
      routes: [
        RouteInfo(
          path: HomePage.path,
          useRootNavigator: false,
          builder: (context, state, child) => const HomePage(),
        ),
        RouteInfo(
          useRootNavigator: false,
          builder: (context, state, child) => SettingsPage(),
          path: SettingsPage.path,
        ),
        RouteInfo(
          useRootNavigator: false,
          builder: (context, state, child) => PostFavouritePage(),
          path: PostFavouritePage.path,
        ),
        RouteInfo(
          useRootNavigator: false,

          builder: (context, state, child) => MapPage(),
          path: MapPage.path,
        ),
      ],
    ),
  ];
}

List<String> tabs = [HomePage.path];

extension R on BuildContext {
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String name, {
    required String until,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    while (GoRouter.of(this).state.name != until) {
      GoRouter.of(this).pop();
    }
    return GoRouter.of(this).pushNamed<T>(
      name,
      extra: extra,
      queryParameters: queryParameters,
      pathParameters: pathParameters,
    );
  }
}
