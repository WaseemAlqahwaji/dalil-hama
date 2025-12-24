import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  String title;
  Map<String, dynamic> payload;

  PostModel({required this.title, required this.payload});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

extension MapToDomain on PostModel {
  Post toDomain() => Post(title: title , );
}
