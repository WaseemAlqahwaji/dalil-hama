// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionModel _$SectionModelFromJson(Map json) => SectionModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String?,
  type: $enumDecode(_$SectionTypeEnumMap, json['type']),
  parentId: json['parentId'] as String?,
  level: (json['level'] as num?)?.toInt(),
  children:
      (json['children'] as List<dynamic>?)
          ?.map(
            (e) => SectionModel.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList() ??
      const [],
);

const _$SectionTypeEnumMap = {
  SectionType.section: 'Section',
  SectionType.service: 'Service',
};
