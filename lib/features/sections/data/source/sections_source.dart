import 'package:core_package/core_package.dart';
import 'package:dalil_hama/configuration.dart';
import 'package:dalil_hama/features/sections/data/model/section_get_params_model/section_get_params_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'sections_source.g.dart';

abstract class SectionsSource {
  Future getSections({required SectionGetParamsModel params});
}

@RestApi()
@Injectable(as: SectionsSource)
abstract class SectionsSourceImpl extends SectionsSource {
  @factoryMethod
  factory SectionsSourceImpl(Dio dio, Configuration configuration) {
    return _SectionsSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @GET("api/Sections")
  @override
  Future getSections({@Queries() required SectionGetParamsModel params});
}
