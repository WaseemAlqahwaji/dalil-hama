// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'schema_field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemaFieldModel _$SchemaFieldModelFromJson(Map json) => SchemaFieldModel(
  fieldType: $enumDecode(_$SchemaFieldTypeEnumMap, json['fieldType']),
  fieldName: json['fieldName'] as String,
  title: json['presentation'] as String?,
);

const _$SchemaFieldTypeEnumMap = {
  SchemaFieldType.kInt: 'Int',
  SchemaFieldType.string: 'String',
  SchemaFieldType.dateTime: 'DateTime',
  SchemaFieldType.date: 'Date',
  SchemaFieldType.timeSpan: 'Timespan',
  SchemaFieldType.bool: 'Bool',
  SchemaFieldType.float: 'Float',
  SchemaFieldType.kEnum: 'Enum',
  SchemaFieldType.decimal: 'Decimal',
  SchemaFieldType.long: 'Long',
  SchemaFieldType.image: 'Image',
  SchemaFieldType.file: 'File',
  SchemaFieldType.email: 'Email',
  SchemaFieldType.phoneNumber: 'PhoneNumber',
  SchemaFieldType.json: 'JSON',
  SchemaFieldType.address: 'Address',
};
