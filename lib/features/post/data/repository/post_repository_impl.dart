import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/data/models/page_gpl_model/page_gql_model.dart';
import 'package:dalil_hama/features/core/data/utils/api_handler.dart';
import 'package:dalil_hama/features/post/data/model/post_model/post_model.dart';
import 'package:dalil_hama/features/post/data/source/remote_source/post_remote_source.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/entity/post_list.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';
import 'package:dalil_hama/features/post/domain/repository/post_repository.dart';
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

  @override
  Future<Either<Failure, PostList>> getPosts(PostGetParams params) {
    return request(() async {
      final result = await source.getPosts(params.getGraphQlQuery());
      await getShemaById(params.serviceId);
      final pageInfoRaw = result['data']['posts']['pageInfo'];
      List? data = result['data']['posts']['nodes'];
      var postsModel = data?.map((e) => PostModel.fromJson(e)).toList() ?? [];
      List<Post> posts = [];
      var pageInfo = PageGqlModel.fromJson(pageInfoRaw).toDomain();
      for (var postModel in postsModel) {
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
      return Right(PostList(pageInfo: pageInfo, post: posts));
    });
  }

  Future<void> getShemaById(String serviceId) async {
    if (serviceId == schemaModel?.serviceId) {
      return;
    }
    final result = await schemaRemoteSource.getSchemaById(serviceId);
    schemaModel = result;
  }
}
