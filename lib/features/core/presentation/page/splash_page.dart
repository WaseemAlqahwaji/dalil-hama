import 'package:dalil_hama/features/home/presentation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  static String path = "/SplashPage";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("data"),
              TextButton(onPressed: (){
                context.go(HomePage.path);
              }, child: Text("kdlsjf"))
            ],
          ),
        ),
      ),
    );
  }
}
