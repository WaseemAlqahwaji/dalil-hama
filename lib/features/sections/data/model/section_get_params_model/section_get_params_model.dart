import 'package:dalil_hama/features/sections/domain/params/section_get_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section_get_params_model.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
class SectionGetParamsModel {
  String? parentId;
  int? level;

  SectionGetParamsModel({this.parentId, this.level});

  Map<String, dynamic> toJson() => _$SectionGetParamsModelToJson(this);
}

extension MapFromDomain on SectionGetParams {
  SectionGetParamsModel fromDomain() =>
      SectionGetParamsModel(level: level, parentId: parentId);
}
