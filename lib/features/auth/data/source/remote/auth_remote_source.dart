import 'package:core_package/core_package.dart';
import 'package:dalil_hama/configuration.dart';
import 'package:dalil_hama/features/auth/data/model/auth_login_model/auth_login_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'auth_remote_source.g.dart';

abstract class AuthRemoteSource {
  Future login(AuthLoginModel params);

  Future resetPassword(String email);
  // Future logout(AuthLoginModel params);
}

@RestApi()
@Injectable(as: AuthRemoteSource)
abstract class AuthRemoteSourceImpl extends AuthRemoteSource {
  @factoryMethod
  factory AuthRemoteSourceImpl(Dio dio, Configuration configuration) {
    return _AuthRemoteSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @POST("api/auth/login")
  @override
  Future<dynamic> login(@Body() AuthLoginModel params);

  @POST("/api/auth/request-password-reset")
  @override
  Future<dynamic> resetPassword(@Query("email") String email);
}
