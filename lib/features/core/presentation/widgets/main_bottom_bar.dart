import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/page/settings_page.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/dynamic_svg_ext.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/home/presentation/page/home_page.dart';
import 'package:dalil_hama/features/map/presentation/map_page.dart';
import 'package:dalil_hama/features/post/presentation/pages/post_favourite_page.dart';
import 'package:dalil_hama/generated/generated_assets/assets.gen.dart';
import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({super.key});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).appSchema.shapeColor.navBar,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Expanded(
              child: _BottomIcon(
                title: context.translation.home,
                route: HomePage.path,
                image: Assets.icons.home,
              ),
            ),
            Expanded(
              child: _BottomIcon(
                title: context.translation.map,
                route: MapPage.path,
                image: Assets.icons.map,
              ),
            ),
            // Expanded(
            //   child: _BottomIcon(
            //     title: context.translation.favourites,
            //     route: PostFavouritePage.path,
            //     image: Assets.icons.fav,
            //   ),
            // ),
            Expanded(
              child: _BottomIcon(
                title: context.translation.settings,
                route: SettingsPage.path,
                image: Assets.icons.settings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomIcon extends StatelessWidget {
  final String route;
  final SvgGenImage image;
  final String title;

  const _BottomIcon({
    required this.title,
    required this.route,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWithoutFeedback(
      onTap: () {
        context.go(route);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: GoRouter.of(context).state.path == route
              ? Theme.of(context).appSchema.primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [image.dynamicSVGColor(context), Text(title)],
        ),
      ),
    );
  }
}
