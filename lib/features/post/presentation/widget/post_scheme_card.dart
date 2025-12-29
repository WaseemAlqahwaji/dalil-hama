import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/presentation/widget/post_button.dart';
import 'package:dalil_hama/features/schema/domain/entity/schema_attribute.dart';
import 'package:flutter/material.dart';

class PostSchemeCard extends StatelessWidget {
  final SchemaAttribute schemaAttribute;
  const PostSchemeCard({super.key, required this.schemaAttribute});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    schemaAttribute.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  4.height(),
                  Text(schemaAttribute.value.toString()),
                ],
              ),
            ),
            PostButton(schemaAttribute: schemaAttribute)
          ],
        ),
      ),
    );
  }
}
