import 'package:dalil_hama/features/core/domain/entity/location.dart';
import 'package:dalil_hama/features/schema/domain/entity/schema_attribute.dart';

class Post {
  String title;
  List<SchemaAttribute> attributes;
  String? imageUrl;
  Location? location;
  String serviceId;

  Post({
    required this.title,
    this.attributes = const [],
    this.imageUrl,
    this.location,
    required this.serviceId,
  });
}
