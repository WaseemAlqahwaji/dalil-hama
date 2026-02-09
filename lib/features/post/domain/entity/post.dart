import 'package:dalil_hama/features/core/domain/entity/location.dart';
import 'package:dalil_hama/features/schema/domain/entity/schema_attribute.dart';

class Post {
  String id;
  String title;
  List<SchemaAttribute> attributes;
  String? imageUrl;
  Location? location;
  String serviceId;
  double ratingAvg;
  double ratingCount;

  Post({
    required this.title,
    this.attributes = const [],
    this.imageUrl,
    this.location,
    required this.serviceId,
    required this.id,
    this.ratingAvg = 0,
    this.ratingCount = 0,
  });

  @override
  bool operator ==(Object other) {
    return other is Post && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  Post clone() => Post(
    title: title,
    serviceId: serviceId,
    id: id,
    attributes: attributes,
    imageUrl: imageUrl,
    location: location,
    ratingAvg: ratingAvg,
  );
}
