import 'package:dalil_hama/features/post/domain/entity/post_attribute.dart';

class Post {
  String title;
  List<PostAttribute> attributes;
  String? imageUrl;

  Post({required this.title, this.attributes = const [], this.imageUrl});
}
