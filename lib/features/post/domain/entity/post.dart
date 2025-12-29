import 'package:dalil_hama/features/schema/domain/entity/schema_attribute.dart';

class Post {
  String title;
  List<SchemaAttribute> attributes;
  String? imageUrl;

  Post({required this.title, this.attributes = const [], this.imageUrl});
}
