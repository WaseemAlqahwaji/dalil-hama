import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/domain/entity/post_list.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';

abstract class PostRepository {
  Future<Either<Failure, PostList>> getPosts(PostGetParams params);
}
