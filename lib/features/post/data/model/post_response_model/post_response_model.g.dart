// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponseModel _$PostResponseModelFromJson(Map json) => PostResponseModel(
  pageInfo: PageGqlModel.fromJson(
    Map<String, dynamic>.from(json['pageInfo'] as Map),
  ),
  nodes: (json['nodes'] as List<dynamic>)
      .map((e) => PostModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList(),
);
