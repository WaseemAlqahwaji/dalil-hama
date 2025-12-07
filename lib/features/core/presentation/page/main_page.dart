import 'package:dalil_hama/features/core/presentation/utils/ext/dynamic_svg_ext.dart';
import 'package:dalil_hama/features/home/presentation/page/home_page.dart';
import 'package:dalil_hama/generated/generated_assets/assets.gen.dart';
import 'package:dalil_hama/routing/routes.dart';
import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  static final String path = "/MainPage";
  const MainPage({super.key, required this.child});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    bool isRoute(String path) => GoRouter.of(context).state.path == path;
    int index = tabs.indexOf(GoRouter.of(context).state.path!);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(bottom: 80, child: widget.child),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                // boxShadow: Theme.of(context).appColor.shadows.mainShadow,
              ),
              height: 80,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: index == -1 ? 0 : index,
                onTap: (i) {
                  context.go(tabs[i]);
                },

                items: [
                  BottomNavigationBarItem(
                    icon: Assets.icons.home.dynamicSVGColor(
                      context,
                      color: isRoute(HomePage.path)
                          ? Theme.of(
                              context,
                            ).appSchema.shapeColor.iconColor.selected
                          : Theme.of(
                              context,
                            ).appSchema.shapeColor.iconColor.unSelected,
                    ),
                    label: "Home",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
