import 'package:dalil_hama/features/core/domain/params/base_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_params_model.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
class BaseParamsModel {
  final int? skip;
  final int? limit;
  final bool? total;
  final String? search;

  const BaseParamsModel({this.skip, this.limit, this.total, this.search});

  Map<String, dynamic> toJson() => _$BaseParamsModelToJson(this);
}

extension MapFromDomain on BaseParams {
  BaseParamsModel fromDomain() {
    return BaseParamsModel(
      skip: skip,
      limit: limit,
      total: total,
      search: search,
    );
  }
}
