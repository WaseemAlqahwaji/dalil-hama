import 'dart:async';

import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/auth/data/model/auth_login_model/auth_login_model.dart';
import 'package:dalil_hama/features/auth/data/source/auth_local_source/auth_local_source.dart';
import 'package:dalil_hama/features/auth/data/source/remote/auth_remote_source.dart';
import 'package:dalil_hama/features/auth/domain/params/auth_login_params.dart';
import 'package:dalil_hama/features/auth/domain/repository/auth_repository.dart';
import 'package:dalil_hama/features/core/data/utils/api_handler.dart';
import 'package:dalil_hama/features/core/domain/entity/user_stream_signal.dart';
import 'package:dalil_hama/features/user/data/model/user_model/user_model.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepoImpl extends AuthRepository with ApiHandler {
  AuthRemoteSource source;
  AuthLocalSource authLocalSource;

  AuthRepoImpl(this.source, this.authLocalSource);

  StreamController<UserStreamSignal> streamController =
      StreamController.broadcast();

  @override
  Future<Either<Failure, void>> login(AuthLoginParams params) {
    return request(() async {
      var res = await source.login(params.fromDomain());
      var user = UserModel.fromJson(res['user']).toDomain();
      var token = res['token'];
      var rToken = res['refreshToken'];
      await authLocalSource.setTokens(token: token, refToken: rToken);
      streamController.add(UserStreamSignal(withPush: true, user: user));
      return Right(null);
    });
  }

  @override
  Future<void> logout() async {
    streamController.add(UserStreamSignal(withPush: true));
    await authLocalSource.clear();
  }

  @override
  Stream<UserStreamSignal> get authStatus => streamController.stream;

  @override
  Future<Either<Failure, void>> resetPassword(String email) {
    return request(() async {
      await source.resetPassword(email);
      return Right(null);
    });
  }
}
