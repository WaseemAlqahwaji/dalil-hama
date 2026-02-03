import 'package:dalil_hama/features/sections/domain/enum/section_type.dart';

class Section {
  final String id;
  final String? parentId;
  final String title;
  final String? imageUrl;
  final String description;
  final int? level;
  final List<Section> children;
  final SectionType type;
  final String? slug;

  const Section({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.parentId,
    this.level,
    required this.type,
    this.children = const [],
    this.slug,
  });
}
