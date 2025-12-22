import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/data/models/page_gpl_model/page_gql_model.dart';
import 'package:dalil_hama/features/core/data/utils/api_handler.dart';
import 'package:dalil_hama/features/post/data/model/post_model.dart';
import 'package:dalil_hama/features/post/data/source/remote_source/post_remote_source.dart';
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
      // await Future.delayed(Duration(seconds: 1));
      final result = await source.getPosts(params.getGraphQlQuery());
      final pageInfo = result['data']['posts']['pageInfo'];
      List? data = result['data']['posts']['nodes'];
      return Right(
        PostList(
          pageInfo: PageGqlModel.fromJson(pageInfo).toDomain(),
          post:
              data?.map((e) => PostModel.fromJson(e).toDomain()).toList() ?? [],
        ),
      );
    });
  }
}
