import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatefulWidget {
  final Post post;
  static final String path = "/PostDetailsPage";
  const PostDetailsPage({super.key, required this.post});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              ImageWidget(
                url: "fuck salem",
                borderRadius: BorderRadius.circular(16),
                width: double.infinity,
                height: 250,
              )
            ],
          ),
        ),
      ),
    );
  }
}
