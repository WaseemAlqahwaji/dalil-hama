import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:dalil_hama/features/sections/domain/params/section_get_params.dart';

abstract class SectionsRepo {
  Future<Either<Failure, List<Section>>> getSections({
    required SectionGetParams params,
  });
}
