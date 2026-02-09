import 'dart:async';

import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/data/models/page_gpl_model/page_gql_model.dart';
import 'package:dalil_hama/features/core/data/utils/api_handler.dart';
import 'package:dalil_hama/features/post/data/model/post_model/post_model.dart';
import 'package:dalil_hama/features/post/data/model/post_response_model/post_response_model.dart';
import 'package:dalil_hama/features/post/data/source/remote_source/post_remote_source.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/entity/post_list.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';
import 'package:dalil_hama/features/post/domain/repository/post_repository.dart';
import 'package:dalil_hama/features/schema/data/model/schema_field_model/schema_field_model.dart';
import 'package:dalil_hama/features/schema/data/model/schema_model/schema_model.dart';
import 'package:dalil_hama/features/schema/data/source/remote/schema_remote_source.dart';
import 'package:dalil_hama/features/schema/domain/entity/schema_attribute.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl extends PostRepository with ApiHandler {
  PostRemoteSource source;
  SchemaRemoteSource schemaRemoteSource;

  SchemaModel? schemaModel;

  PostRepositoryImpl(this.source, this.schemaRemoteSource);

  StreamController<void> refreshController = StreamController.broadcast();
  StreamController<Post> postRefreshedController = StreamController.broadcast();

  @override
  Future<Either<Failure, PostList>> getPosts(PostGetParams params) {
    return request(() async {
      final rawResult = await source.getPosts(params.getGraphQlQuery());
      final PostResponseModel response = PostResponseModel.fromJson(
        rawResult['data']['posts'],
      );
      if (response.nodes.isEmpty) {
        return Right(
          PostList(post: [], pageInfo: response.pageInfo.toDomain()),
        );
      }
      String serviceId = response.nodes.first.service;
      await getShemaById(serviceId);
      List<Post> posts = [];
      for (var postModel in response.nodes) {
        List<SchemaAttribute> postAttributes = [];
        for (var key in postModel.payload.keys) {
          int i = schemaModel!.schema.indexWhere((e) => e.fieldName == key);
          if (i > -1) {
            postAttributes.add(
              SchemaAttribute(
                type: schemaModel!.schema[i].fieldType,
                title: schemaModel!.schema[i].title ?? key,
                value: postModel.payload[key]!,
              ),
            );
          }
        }
        var result = postModel.toDomain();
        result.attributes = postAttributes;
        posts.add(result);
      }
      return Right(
        PostList(pageInfo: response.pageInfo.toDomain(), post: posts),
      );
    });
  }

  Future<SchemaModel> getShemaById(String serviceId) async {
    final result = await schemaRemoteSource.getSchemaById(serviceId);
    return result;
  }

  @override
  Future<Either<Failure, PostList>> getPosts2(PostGetParams params) {
    return request(() async {
      final rawResult = await source.getPosts(params.getGraphQlQuery());
      final PostResponseModel response = PostResponseModel.fromJson(
        rawResult['data']['posts'],
      );
      return Right(
        PostList(
          pageInfo: response.pageInfo.toDomain(),
          post: response.nodes.map((e) => e.toDomain()).toList(),
        ),
      );
    });
  }

  @override
  Future<Either<Failure, Post>> getPostsById(String postId) {
    return request(() async {
      final rawResult = await source.getPosts(
        PostGetParams(
          first: 1,
          postGetFilters: PostGetFilters(id: postId),
        ).getGraphQlQuery(),
      );
      final PostResponseModel response = PostResponseModel.fromJson(
        rawResult['data']['posts'],
      );
      var postModel = response.nodes.first;
      Post post = postModel.toDomain();
      var schema = await getShemaById(post.serviceId);
      List<SchemaFieldModel> attributes = schema.schema;
      for (var e in attributes) {
        if (postModel.payload[e.fieldName] != null) {
          post.attributes.add(
            SchemaAttribute(
              type: e.fieldType,
              title: e.title ?? e.fieldName,
              value: postModel.payload[e.fieldName],
            ),
          );
        }
      }
      postRefreshedController.add(post);
      return Right(post);
    });
  }

  @override
  Future<Either<Failure, void>> rate(String postId, double value) {
    return request(() async {
      await source.rate(postId, value.toStringAsFixed(0));

      refreshController.add(null);
      return Right(null);
    });
  }

  @override
  Stream<void> get refreshStream => refreshController.stream;

  @override
  Future<Either<Failure, void>> unRate(String postId) {
    return request(() async {
      await source.unRate(postId);
      refreshController.add(null);
      return Right(null);
    });
  }

  @override
  Stream<Post> get postRefreshed => postRefreshedController.stream;
}
