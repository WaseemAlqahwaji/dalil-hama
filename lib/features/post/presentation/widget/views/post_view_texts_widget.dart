import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/schema/domain/entity/schema_attribute.dart';
import 'package:dalil_hama/features/schema/domain/enum/schema_field_type.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostViewTextsWidget extends StatefulWidget {
  final SchemaAttribute schemaAttribute;
  const PostViewTextsWidget({super.key, required this.schemaAttribute});

  @override
  State<PostViewTextsWidget> createState() => _PostViewTextsWidgetState();
}

class _PostViewTextsWidgetState extends State<PostViewTextsWidget> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.titleMedium!;
    var value = widget.schemaAttribute.value;
    return switch (widget.schemaAttribute.type) {
      SchemaFieldType.kInt => Text(value.toString()),
      SchemaFieldType.string => Text(value, style: style),
      SchemaFieldType.dateTime => Text(
        DateTime.parse(value).formateDateLocaled(
          dateTimePattern: DateTimePattern.dMmmYDotHhMmA,
          context: context,
        ),
        style: style,
      ),
      SchemaFieldType.date => Text(
        DateTime.parse(value).formateDateLocaled(
          dateTimePattern: DateTimePattern.ddMmmmYyyy,
          context: context,
        ),
        style: style,
      ),
      SchemaFieldType.timeSpan => Text(value, style: style),
      SchemaFieldType.bool => Text(
        value == true
            ? context.translation.truecase
            : context.translation.falsecase,
        style: style,
      ),
      SchemaFieldType.float => Text(value.toString(), style: style),
      SchemaFieldType.kEnum => Text(value, style: style),
      SchemaFieldType.decimal => Text(value.toString(), style: style),
      SchemaFieldType.long => Text(value.toString(), style: style),
      SchemaFieldType.address => Text(value, style: style),
      SchemaFieldType.email => Row(
        children: [
          Icon(Icons.email),
          8.width(),
          Expanded(child: Text(value, style: style)),
          ElevatedButton(
            onPressed: () async {
              await launchUrl(Uri.parse("mailto:$value"));
            },
            child: Text(context.translation.sendEmail),
          ),
        ],
      ),
      SchemaFieldType.phoneNumber => Row(
        children: [
          Icon(Icons.phone),
          8.width(),
          Expanded(
            child: Text(
              value,
              style: style,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.end,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await launchUrl(Uri.parse("tel:$value"));
            },
            child: Text(context.translation.callNow),
          ),
        ],
      ),
      _ => SizedBox.shrink(),
    };
  }
}
