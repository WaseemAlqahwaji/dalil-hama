import 'package:core_package/core_package.dart';
import 'package:dalil_hama/configuration.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'post_remote_source.g.dart';

abstract class PostRemoteSource {
  Future getPosts(String query);

  Future getSchemaById(String serviceId);

  Future getPostById(String slug, String post);

  Future rate(String postId, String value);

  Future unRate(String postId);
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

  @GET("api/{slug}/{id}")
  @override
  Future<dynamic> getPostById(@Path() String slug, @Path("id") String post);

  @POST("api/posts/{postId}/rating")
  @override
  Future<dynamic> rate(@Path() String postId, @Field() String value);

  @DELETE("api/posts/{postId}/rating")
  @override
  Future<dynamic> unRate(@Path() String postId);
}
