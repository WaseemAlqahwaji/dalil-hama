import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  String title;

  PostModel({required this.title});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}


extension MapToDomain on PostModel {
  Post toDomain() => Post(title: title);
}

