import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/themes/app_theme.dart';
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
      borderColor: Theme.of(context).appSchema.shapeColor.borderColor,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            ImageWidget(
              radius: 62,
              shape: BoxShape.circle,
              url: widget.post.imageUrl,
              placeHolder: Icon(Icons.image),
            ),
            8.width(),
            Expanded(
              child: Text(
                widget.post.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
