import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthResetPasswordCubit extends Cubit<BaseState<void>> {
  AuthResetPasswordCubit(this.repository) : super(BaseState());
  final AuthRepository repository;

  void reset(String email) async {
    emit(state.setInProgressState());
    var res = await repository.resetPassword(email);
    res.fold(
          (e) => emit(state.setFailureState(e)),
          (r) => emit(state.setSuccessState(null)),
    );
  }
}
