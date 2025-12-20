import 'package:core_package/core_package.dart';
import 'package:dalil_hama/configuration.dart';
import 'package:dalil_hama/features/core/data/models/base_response/base_response.dart';
import 'package:dalil_hama/features/sections/data/model/section_model/section_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'sections_source.g.dart';

abstract class SectionsSource {
  Future<BaseResponse<List<SectionModel>>> getSections();
}

@RestApi()
@Injectable(as: SectionsSource)
abstract class SectionsSourceImpl extends SectionsSource {
  @factoryMethod
  factory SectionsSourceImpl(Dio dio, Configuration configuration) {
    return _SectionsSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @GET("Sections")
  @override
  Future<BaseResponse<List<SectionModel>>> getSections();
}
