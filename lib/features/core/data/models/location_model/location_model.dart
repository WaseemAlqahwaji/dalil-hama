import 'package:dalil_hama/features/core/domain/entity/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(createToJson: true)
class LocationModel {
  double longitude;
  double latitude;

  LocationModel({required this.latitude, required this.longitude});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

extension MapToDomain on LocationModel {
  Location toDomain() => Location(latitude: latitude, longitude: longitude);
}

extension MapFromDomain on Location {
  LocationModel fromDomain() =>
      LocationModel(longitude: longitude, latitude: latitude);
}
