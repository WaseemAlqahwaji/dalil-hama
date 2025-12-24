import 'package:core_package/core_package.dart';
import 'package:dalil_hama/configuration.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'post_remote_source.g.dart';

abstract class PostRemoteSource {
  Future getPosts(String query);

  Future getSchemaById(String serviceId);
}

@RestApi()
@Injectable(as: PostRemoteSource)
abstract class PostRemoteSourceImpl extends PostRemoteSource {
  @factoryMethod
  factory PostRemoteSourceImpl(Dio dio, Configuration configuration) {
    return _PostRemoteSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @POST("graphql")
  @override
  Future getPosts(@Field("query") String query);

  @GET("api/schemas/{id}")
  @override
  Future getSchemaById(@Path("id") String serviceId);
}
