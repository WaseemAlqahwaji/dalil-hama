import 'package:dalil_hama/features/schema/data/model/schema_field_model/schema_field_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schema_model.g.dart';

@JsonSerializable()
class SchemaModel {
  final String serviceId;
  final List<SchemaFieldModel> schema;

  SchemaModel({required this.serviceId, required this.schema});

  factory SchemaModel.fromJson(Map<String, dynamic> json) =>
      _$SchemaModelFromJson(json);
}
