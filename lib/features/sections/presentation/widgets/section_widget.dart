import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/presentation/pages/posts_page.dart';
import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SectionWidget extends StatefulWidget {
  final Section section;

  const SectionWidget({super.key, required this.section});

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWellWithoutFeedback(
      onTap: () {
        context.push(PostsPage.path, extra: widget.section);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 4,
                color: Theme.of(context).appSchema.shapeColor.borderColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).appSchema.shapeColor.navBar,
                  ),
                  child: Icon(Icons.wallet),
                ),
                8.width(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.section.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          widget.section.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
