import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/presentation/widget/post_scheme_card.dart';
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
      appBar: AppBar(title: Text(widget.post.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  16.height(),
                  ImageWidget(
                    url: "fuck salem",
                    borderRadius: BorderRadius.circular(16),
                    width: double.infinity,
                    height: 250,
                  ),
                  16.height(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.post.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Icon(Icons.abc),
                    ],
                  ),
                  16.height(),
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => PostSchemeCard(
                      schemaAttribute: widget.post.attributes[index],
                    ),
                    separatorBuilder: (context, index) => 8.height(),
                    itemCount: widget.post.attributes.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
