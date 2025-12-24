import 'package:json_annotation/json_annotation.dart';

enum PostAttributeType {
  @JsonValue("Int")
  kInt,
  @JsonValue("String")
  string,
  @JsonValue("DateTime")
  dateTime,
  @JsonValue("Date")
  date,
  @JsonValue("Timespan")
  timeSpan,
  @JsonValue("Bool")
  bool,
  @JsonValue("Float")
  float,
  @JsonValue("Enum")
  kEnum,
  @JsonValue("Decimal")
  decimal,
  @JsonValue("Long")
  long,
  @JsonValue("Image")
  image,
  @JsonValue("File")
  file,
  @JsonValue("Email")
  email,
  @JsonValue("PhoneNumber")
  phoneNumber,
  @JsonValue("JSON")
  json,

  // final int priority;

  // const PostFieldType(this.priority);
}

// Int,
// String,
// DateTime,
// Date,
// Timespan,
// Bool,
// Float,
// Enum,
// Decimal,
// Long,
// Image,
// File,
// Email,
// PhoneNumber,
// JSON
