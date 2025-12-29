import 'package:core_package/core_package.dart';
import 'package:dalil_hama/configuration.dart';
import 'package:dalil_hama/features/schema/data/model/schema_model/schema_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'schema_remote_source.g.dart';

abstract class SchemaRemoteSource {
  Future<SchemaModel> getSchemaById(String serviceId);
}

@RestApi()
@Injectable(as: SchemaRemoteSource)
abstract class SchemaRemoteSourceImpl extends SchemaRemoteSource {
  @factoryMethod
  factory SchemaRemoteSourceImpl(Dio dio, Configuration configuration) {
    return _SchemaRemoteSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @override
  @GET("api/schemas/{serviceId}")
  Future<SchemaModel> getSchemaById(@Path("serviceId") String serviceId);
}
