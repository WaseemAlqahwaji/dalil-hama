import 'package:dalil_hama/features/schema/domain/enum/schema_field_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schema_field_model.g.dart';

@JsonSerializable()
class SchemaFieldModel {
  @JsonKey(name: "presentation")
  final String? title;
  final SchemaFieldType fieldType;
  final String fieldName;

  SchemaFieldModel({required this.fieldType, required this.fieldName , this.title,});

  factory SchemaFieldModel.fromJson(Map<String, dynamic> json) =>
      _$SchemaFieldModelFromJson(json);
}
