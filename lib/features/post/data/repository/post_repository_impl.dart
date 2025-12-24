import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/data/models/page_gpl_model/page_gql_model.dart';
import 'package:dalil_hama/features/core/data/utils/api_handler.dart';
import 'package:dalil_hama/features/post/data/model/post_model/post_model.dart';
import 'package:dalil_hama/features/post/data/model/post_schema_model/post_schema_model.dart';
import 'package:dalil_hama/features/post/data/source/remote_source/post_remote_source.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/entity/post_attribute.dart';
import 'package:dalil_hama/features/post/domain/entity/post_list.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';
import 'package:dalil_hama/features/post/domain/repository/post_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostRepository)
class PostRepositoryImpl extends PostRepository with ApiHandler {
  PostRemoteSource source;

  PostRepositoryImpl(this.source);

  @override
  Future<Either<Failure, PostList>> getPosts(PostGetParams params) {
    return request(() async {
      final result = await source.getPosts(params.getGraphQlQuery());
      List schemaRaw = (await source.getSchemaById(params.serviceId))['schema'];
      List<PostSchemaModel> schema = schemaRaw
          .map((e) => PostSchemaModel.fromJson(e))
          .toList();
      final pageInfoRaw = result['data']['posts']['pageInfo'];
      List? data = result['data']['posts']['nodes'];
      var postsModel = data?.map((e) => PostModel.fromJson(e)).toList() ?? [];
      List<Post> posts = [];
      var pageInfo = PageGqlModel.fromJson(pageInfoRaw).toDomain();
      for (var postModel in postsModel) {
        List<PostAttribute> postAttributes = [];
        for (var key in postModel.payload.keys) {
          int i = schema.indexWhere((e) => e.fieldName == key);
          if (i > -1) {
            postAttributes.add(
              PostAttribute(
                postAttributeType: schema[i].fieldType,
                title: key,
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
}
