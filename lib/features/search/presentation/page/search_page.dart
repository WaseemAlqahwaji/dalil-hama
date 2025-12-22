import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static final String path = "/SearchPage";
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: context.translation.searchForAnything,
          ),
        ),
      ),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
