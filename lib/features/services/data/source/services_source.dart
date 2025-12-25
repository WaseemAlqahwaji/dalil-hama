import 'package:core_package/core_package.dart';
import 'package:dalil_hama/configuration.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'services_source.g.dart';

abstract class ServicesSource {
  Future getServices({required String sectionId});
}

@RestApi()
@Injectable(as: ServicesSource)
abstract class ServicesSourceImpl extends ServicesSource {
  @factoryMethod
  factory ServicesSourceImpl(Dio dio, Configuration configuration) {
    return _ServicesSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @GET("api/Sections/{sectionId}/services")
  @override
  Future getServices({@Path("sectionId") required String sectionId});
}
