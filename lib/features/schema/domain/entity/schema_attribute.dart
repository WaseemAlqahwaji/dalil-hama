import 'package:dalil_hama/features/schema/domain/enum/schema_field_type.dart';

class SchemaAttribute {
  final dynamic value;
  final String title;
  final SchemaFieldType type;

  @override
  String toString() {
    return {
      "type": type,
      "title": title,
      "value": value,
    }.toString();
  }

  SchemaAttribute({
    required this.type,
    required this.title,
    required this.value,
  });
}