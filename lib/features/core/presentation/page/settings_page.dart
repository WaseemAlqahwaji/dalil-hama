import 'package:dalil_hama/features/user/presentation/widget/user_profile_card.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static String path = "/SettingsPage";

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserProfileCard()
            ],
          ),
        ),
      ),
    );
  }
}
