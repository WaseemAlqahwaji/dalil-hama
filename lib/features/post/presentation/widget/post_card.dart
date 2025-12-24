import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          widget.post.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
