import 'package:dalil_hama/features/post/domain/enum/post_attribute_type.dart';

class PostAttribute {
  final PostAttributeType postAttributeType;
  final dynamic value;
  final String title;

  @override
  String toString() {
    return {
      "type": postAttributeType,
      "title": title,
      "value": value,
    }.toString();
  }

  PostAttribute({
    required this.postAttributeType,
    required this.title,
    required this.value,
  });
}
