import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/core/presentation/widgets/main_bottom_bar.dart';
import 'package:dalil_hama/routing/routes.dart';
import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CorePage extends StatefulWidget {
  final Widget child;
  static final String path = "/CorePage";

  const CorePage({super.key, required this.child});

  @override
  State<CorePage> createState() => _MainPageState();
}

class _MainPageState extends State<CorePage> {
  @override
  Widget build(BuildContext context) {

    return GradientScaffold(
      body: widget.child,
      bottomNavigationBar: MainBottomBar(),
    );
  }
}
