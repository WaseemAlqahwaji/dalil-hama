import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String path = "/HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translation.home),
      ),
    );
  }
}
