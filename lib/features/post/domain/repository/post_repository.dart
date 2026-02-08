import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/entity/post_list.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';

abstract class PostRepository {
  Future<Either<Failure, PostList>> getPosts(PostGetParams params);
  Future<Either<Failure, PostList>> getPosts2(PostGetParams params);
  Future<Either<Failure, Post>> getPostsById(String postId);
}
