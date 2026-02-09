// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map json) => PostModel(
  title: json['title'] as String,
  payload: Map<String, dynamic>.from(json['payload'] as Map),
  imageUrl: json['imageUrl'] as String?,
  location: json['location'] == null
      ? null
      : LocationModel.fromJson(
          Map<String, dynamic>.from(json['location'] as Map),
        ),
  service: _fromJson(json['service']),
  id: json['id'] as String,
  ratingAvg: (json['ratingAvg'] as num?)?.toDouble() ?? 0,
  ratingCount: (json['ratingCount'] as num?)?.toDouble() ?? 0,
);
