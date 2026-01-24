import 'package:flutter/material.dart';

class AuthLoginPage extends StatefulWidget {
  static String path = "/AuthLoginPage";

  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //
            ],
          ),
        ),
      ),
    );
  }
}
