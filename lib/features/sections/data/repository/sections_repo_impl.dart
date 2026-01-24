import 'dart:async';

import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/data/utils/api_handler.dart';
import 'package:dalil_hama/features/sections/data/model/section_get_params_model/section_get_params_model.dart';
import 'package:dalil_hama/features/sections/data/model/section_model/section_model.dart';
import 'package:dalil_hama/features/sections/data/source/sections_source.dart';
import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:dalil_hama/features/sections/domain/params/section_get_params.dart';
import 'package:dalil_hama/features/sections/domain/repository/sections_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SectionsRepo)
class SectionsRepoImpl extends SectionsRepo with ApiHandler {
  final SectionsSource source;

  SectionsRepoImpl(this.source);

  @override
  Future<Either<Failure, List<Section>>> getSections({
    required SectionGetParams params,
  }) {
    return request(() async {
      var res = await source.getSections(params: params.fromDomain());
      return Right(
        (res as List).map((e) => SectionModel.fromJson(e).toDomain()).toList(),
      );
    });
  }
}
