import 'package:json_annotation/json_annotation.dart';

enum SectionType {
  @JsonValue("Section")
  section,
  @JsonValue("Service")
  service,
}
