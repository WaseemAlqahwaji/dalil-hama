import 'package:dalil_hama/features/services/domain/entity/service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String slug;
  final String? imageUrl;

  const ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.slug,
    this.imageUrl,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}

extension MapFromDomain on ServiceModel {
  KService toDomain() => KService(
    serviceId: id,
    slug: slug,
    description: description,
    id: id,
    title: title,
  );
}
