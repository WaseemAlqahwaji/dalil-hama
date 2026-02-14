import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SectionWidget extends StatefulWidget {
  final Section section;

  const SectionWidget({super.key, required this.section});

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 4,
          color: Theme.of(context).appSchema.shapeColor.borderColor,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned.fill(
            child: ImageWidget(
              coverColor: Colors.black.withValues(alpha: 0.6),
              blendMode: BlendMode.darken,
              placeHolder: Container(),
              borderRadius: BorderRadius.circular(16),
              url:
                  widget.section.imageUrl,
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: AlignmentDirectional.bottomStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.section.title,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 4,
                  ),
                  4.height(),
                  if (widget.section.description != null)
                    Text(
                      widget.section.description!,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
