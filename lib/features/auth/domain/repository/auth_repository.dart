import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/auth/domain/params/auth_login_params.dart';
import 'package:dalil_hama/features/core/domain/entity/user_stream_signal.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login(AuthLoginParams params);
  Future<void> logout();

  Stream<UserStreamSignal> get authStatus;

  Future<Either<Failure , void>> resetPassword(String email);

}
