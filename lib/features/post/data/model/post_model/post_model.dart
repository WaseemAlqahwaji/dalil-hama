import 'package:dalil_hama/features/core/data/models/location_model/location_model.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  String title;
  Map<String, dynamic> payload;
  final String? imageUrl;
  final LocationModel? location;
  @JsonKey(fromJson: _fromJson)
  final String service;

  PostModel({
    required this.title,
    required this.payload,
    this.imageUrl,
    this.location,
    required this.service,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

String _fromJson(dynamic json) => json["id"];

extension MapToDomain on PostModel {
  Post toDomain() => Post(
    title: title,
    imageUrl: imageUrl,
    serviceId: service,
    location: location?.toDomain(),
  );
}
