import 'dart:async';

import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/data/utils/api_handler.dart';
import 'package:dalil_hama/features/sections/data/model/section_model/section_model.dart';
import 'package:dalil_hama/features/sections/data/source/sections_source.dart';
import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:dalil_hama/features/sections/domain/repository/sections_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SectionsRepo)
class SectionsRepoImpl extends SectionsRepo with ApiHandler {
  final SectionsSource source;

  SectionsRepoImpl(this.source);

  @override
  Future<Either<Failure, List<Section>>> getSections() {
    return request(() async {
      var res = await source.getSections();
      return Right(res.data!.map((e) => e.toDomain()).toList());
    });
  }
}
