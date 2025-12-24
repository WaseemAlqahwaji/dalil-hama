import 'package:dalil_hama/features/post/domain/enum/post_attribute_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_schema_model.g.dart';

@JsonSerializable()
class PostSchemaModel {
  final PostAttributeType fieldType;
  final String fieldName;

  const PostSchemaModel(this.fieldName, this.fieldType);

  factory PostSchemaModel.fromJson(Map<String, dynamic> json) =>
      _$PostSchemaModelFromJson(json);
}
