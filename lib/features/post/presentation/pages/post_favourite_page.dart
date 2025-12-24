import 'package:flutter/material.dart';

class PostFavouritePage extends StatefulWidget {
  static String path = "/PostFavouritePage";

  const PostFavouritePage({super.key});

  @override
  State<PostFavouritePage> createState() => _PostFavouritePageState();
}

class _PostFavouritePageState extends State<PostFavouritePage> {
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
