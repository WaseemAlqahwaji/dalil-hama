import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;

  const MainPage({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).appSchema.scaffolGradientBackgroundColor.backgroundColor,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              tileMode: TileMode.clamp,
              colors: [
                Theme.of(
                  context,
                ).appSchema.scaffolGradientBackgroundColor.bottomRadialColor,
                Colors.transparent,
              ],
              center: AlignmentDirectional.topEnd,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Theme.of(
                    context,
                  ).appSchema.scaffolGradientBackgroundColor.topRadialColor,
                  Colors.transparent,
                ],
                center: AlignmentDirectional.bottomStart,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
