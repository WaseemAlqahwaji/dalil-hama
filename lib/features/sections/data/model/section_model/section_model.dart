import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  const SectionModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
}

extension MapFromDomain on SectionModel {
  Section toDomain() => Section(
    description: description,
    id: id,
    imageUrl: imageUrl,
    title: title,
  );
}
