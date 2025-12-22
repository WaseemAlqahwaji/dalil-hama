import 'package:dalil_hama/features/core/domain/entity/page_gpl.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';

class PostList {
  PageGpl pageInfo;
  List<Post> post;

  PostList({required this.pageInfo, required this.post});
}
