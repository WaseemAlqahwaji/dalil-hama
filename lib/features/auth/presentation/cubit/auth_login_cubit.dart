import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/auth/domain/params/auth_login_params.dart';
import 'package:dalil_hama/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthLoginCubit extends Cubit<BaseState<void>> {
  AuthLoginCubit(this.repository) : super(BaseState());
  final AuthRepository repository;

  void login(AuthLoginParams params) async {
    emit(state.setInProgressState());
    var res = await repository.login(params);
    res.fold(
      (e) => emit(state.setFailureState(e)),
      (r) => emit(state.setSuccessState(null)),
    );
  }
}
