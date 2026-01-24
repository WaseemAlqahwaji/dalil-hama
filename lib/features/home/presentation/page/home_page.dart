import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/core/presentation/widgets/main_app_bar.dart';
import 'package:dalil_hama/features/sections/presentation/widgets/section_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String path = "/HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  bool canBack = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleText: context.translation.dalilHama,
        description: context.translation.selectSection,
        icon: canBack ? BackButton() : Icon(Icons.location_on),
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SectionListWidget(
          canBack: (v) {
            setState(() {
              canBack = v;
            });
          },
        ),
      ),
    );
  }
}
