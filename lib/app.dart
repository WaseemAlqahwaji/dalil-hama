import 'package:core_package/generated/core_translation/core_translations.dart';
import 'package:dalil_hama/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dalil_hama/features/home/presentation/page/home_page.dart';
import 'package:dalil_hama/injection.dart';
import 'package:dalil_hama/routing/observer_utils.dart';
import 'package:dalil_hama/routing/route_info.dart';
import 'package:dalil_hama/routing/routes.dart';
import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) {
      authCubit.init();
    });
    super.initState();
  }

  final authCubit = getIt<AuthCubit>();

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
      theme: AppTheme(getSchema()).getThemeData(fontFamily: 'Cairo'),
      routerConfig: goRouterConfig,
      builder: (context, child) {
        return Builder(
          builder: (context) {
            if (child == null) {
              return const SizedBox.shrink();
            }
            return MultiBlocListener(
              listeners: [
                BlocListener<AuthCubit, AuthState>(
                  bloc: authCubit,
                  listenWhen: (v1, v2) =>
                      v1.authState != v2.authState && !v1.authenticated,
                  listener: (context, state) {
                    goRouterConfig.go(HomePage.path);
                  },
                ),
              ],
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: TextScaler.linear(0.9)),
                  child: child,
                ),
              ),
            );
          },
        );
      },
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
    pageBuilder: tabs.contains(subRoute.path)
        ? (context, state) =>
              NoTransitionPage(child: subRoute.builder(context, state, null))
        : null,
  );
}).toList();
