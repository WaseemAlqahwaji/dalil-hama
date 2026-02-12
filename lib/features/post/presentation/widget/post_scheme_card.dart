import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/post/presentation/widget/views/post_view_texts_widget.dart';
import 'package:dalil_hama/features/schema/domain/entity/schema_attribute.dart';
import 'package:dalil_hama/features/schema/domain/enum/schema_field_type.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostSchemeCard extends StatelessWidget {
  final SchemaAttribute schemaAttribute;
  const PostSchemeCard({super.key, required this.schemaAttribute});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              schemaAttribute.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            8.height(),
            if (schemaAttribute.isText) ...[
              PostViewTextsWidget(schemaAttribute: schemaAttribute),
            ],
            if (schemaAttribute.type == SchemaFieldType.image) ...[
              ImageWidget(
                url: schemaAttribute.value,
                height: 200,
                width: double.infinity,
                placeHolder: Icon(Icons.image),
              ),
            ],
            if (schemaAttribute.type == SchemaFieldType.file) ...[
              TextButton(
                child: Text(
                  context.translation.openFile,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Colors.cyan),
                ),
                onPressed: () {
                  launchUrl(Uri.parse(schemaAttribute.value));
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
