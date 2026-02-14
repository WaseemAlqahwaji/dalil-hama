import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:dalil_hama/features/sections/domain/enum/section_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {
  final String id;
  final String title;
  final String? description;
  final String? imageUrl;
  final SectionType type;
  final String? parentId;
  final int? level;
  final List<SectionModel> children;
  final String? slug;

  const SectionModel({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.type,
    this.parentId,
    this.level,
    this.children = const [],
    this.slug,
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
    type: type,
    children: children.map((e) => e.toDomain()).toList(),
    level: level,
    parentId: parentId,
    slug: slug,
  );
}
