import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/schema/domain/entity/schema_attribute.dart';
import 'package:dalil_hama/features/schema/domain/enum/schema_field_type.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostButton extends StatefulWidget {
  final SchemaAttribute schemaAttribute;

  const PostButton({super.key, required this.schemaAttribute});

  @override
  State<PostButton> createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  @override
  Widget build(BuildContext context) {
    switch (widget.schemaAttribute.type) {
      case SchemaFieldType.address:
        return ElevatedButton(
          child: Text(context.translation.openInMap),
          onPressed: () async {
            launchUrl(
              Uri.parse(
                "https://www.google.com/maps/search/?query=35.1408,36.7553",
              ),
            );
          },
        );
      case SchemaFieldType.phoneNumber:
        return ElevatedButton(
          child: Text(context.translation.call),
          onPressed: () async {
            launchUrl(
              Uri.parse("tel://${widget.schemaAttribute.value.toString()}"),
            );
          },
        );
      case SchemaFieldType.email:
        return ElevatedButton(
          child: Text(context.translation.sendMail),
          onPressed: () async {
            launchUrl(
              Uri.parse("mailto://${widget.schemaAttribute.value.toString()}"),
            );
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
