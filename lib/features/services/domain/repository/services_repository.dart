import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/services/domain/entity/service.dart';
abstract class ServicesRepository {
  Future<Either<Failure, List<KService>>> getServices({
    required String sectionId,
  });
}
