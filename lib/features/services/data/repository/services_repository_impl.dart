import 'dart:async';

import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/data/utils/api_handler.dart';
import 'package:dalil_hama/features/services/data/model/service_model/service_model.dart';
import 'package:dalil_hama/features/services/data/source/services_source.dart';
import 'package:dalil_hama/features/services/domain/entity/service.dart';
import 'package:dalil_hama/features/services/domain/repository/services_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ServicesRepository)
class ServicesRepositoryImpl extends ServicesRepository with ApiHandler {
  final ServicesSource source;

  ServicesRepositoryImpl(this.source);

  @override
  Future<Either<Failure, List<KService>>> getServices({
    required String sectionId,
  }) {
    return request(() async {
      var res = await source.getServices(sectionId: sectionId);
      return Right(
        (res as List).map((e) => ServiceModel.fromJson(e).toDomain()).toList(),
      );
    });
  }
}
