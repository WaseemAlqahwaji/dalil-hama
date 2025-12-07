import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/sections/domain/entity/section.dart';

abstract class SectionsRepo {
  Future<Either<Failure, List<Section>>> getSections();
}
