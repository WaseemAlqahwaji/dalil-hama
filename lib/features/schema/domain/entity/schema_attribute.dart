import 'package:dalil_hama/features/schema/domain/enum/schema_field_type.dart';

class SchemaAttribute {
  final dynamic value;
  final String title;
  final SchemaFieldType type;

  bool get isText =>
      [
        SchemaFieldType.date,
        SchemaFieldType.dateTime,
        SchemaFieldType.email,
        SchemaFieldType.decimal,
        SchemaFieldType.phoneNumber,
        SchemaFieldType.kEnum,
        SchemaFieldType.kInt,
        SchemaFieldType.float,
        SchemaFieldType.string,
        SchemaFieldType.timeSpan,
        SchemaFieldType.bool,
        SchemaFieldType.address,
        SchemaFieldType.long,
      ].contains(type);

       bool get execluded =>
      [
        // SchemaFieldType.file,
        SchemaFieldType.json
      ].contains(type);

  @override
  String toString() {
    return {"type": type, "title": title, "value": value}.toString();
  }

  SchemaAttribute({
    required this.type,
    required this.title,
    required this.value,
  });
}
