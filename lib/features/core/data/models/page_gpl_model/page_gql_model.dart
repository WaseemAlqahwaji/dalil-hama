import 'package:dalil_hama/features/core/domain/entity/page_gpl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_gql_model.g.dart';

@JsonSerializable()
class PageGqlModel {
  bool hasNextPage;
  String endCursor;

  PageGqlModel({required this.endCursor, required this.hasNextPage});

  factory PageGqlModel.fromJson(Map<String, dynamic> json) =>
      _$PageGqlModelFromJson(json);
}

extension MapToDomain on PageGqlModel {
  PageGpl toDomain() => PageGpl(endCursor: endCursor, hasNextPage: hasNextPage);
}
