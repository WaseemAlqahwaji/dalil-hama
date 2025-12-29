// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'schema_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemaModel _$SchemaModelFromJson(Map json) => SchemaModel(
  serviceId: json['serviceId'] as String,
  schema: (json['schema'] as List<dynamic>)
      .map(
        (e) => SchemaFieldModel.fromJson(Map<String, dynamic>.from(e as Map)),
      )
      .toList(),
);
