// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'post_schema_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostSchemaModel _$PostSchemaModelFromJson(Map json) => PostSchemaModel(
  json['fieldName'] as String,
  $enumDecode(_$PostAttributeTypeEnumMap, json['fieldType']),
);

const _$PostAttributeTypeEnumMap = {
  PostAttributeType.kInt: 'Int',
  PostAttributeType.string: 'String',
  PostAttributeType.dateTime: 'DateTime',
  PostAttributeType.date: 'Date',
  PostAttributeType.timeSpan: 'Timespan',
  PostAttributeType.bool: 'Bool',
  PostAttributeType.float: 'Float',
  PostAttributeType.kEnum: 'Enum',
  PostAttributeType.decimal: 'Decimal',
  PostAttributeType.long: 'Long',
  PostAttributeType.image: 'Image',
  PostAttributeType.file: 'File',
  PostAttributeType.email: 'Email',
  PostAttributeType.phoneNumber: 'PhoneNumber',
  PostAttributeType.json: 'JSON',
};
