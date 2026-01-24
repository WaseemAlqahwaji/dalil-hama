import 'package:dalil_hama/features/core/data/models/page_gpl_model/page_gql_model.dart';
import 'package:dalil_hama/features/post/data/model/post_model/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_response_model.g.dart';

@JsonSerializable()
class PostResponseModel {
  final List<PostModel> nodes;
  final PageGqlModel pageInfo;

  PostResponseModel({required this.pageInfo, required this.nodes});

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json);

}
