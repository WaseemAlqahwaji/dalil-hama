import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;

  const SectionModel({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
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
