import 'package:core_package/core_package.dart';

class SectionGetParams extends PaginationParams {
  String? parentId;
  int? level;

  SectionGetParams({this.level, this.parentId});

  @override
  void reset() {}
}
