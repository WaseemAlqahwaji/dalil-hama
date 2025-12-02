import 'package:dalil_hama/features/core/domain/entity/user_stream_signal.dart';
import 'package:dalil_hama/features/user/domain/user.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

class AuthState {
  AuthStateType authState;

  AuthState({
    this.authState = AuthStateType.initial,
    this.userData,
    this.withPush = false,
  });

  User? userData;

  User get user {
    if (userData == null) {
      throw Exception("UNAUTH");
    }
    return userData!;
  }

  bool withPush;

  bool get authenticated => authState == AuthStateType.authenticated;
}

@singleton
class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(AuthState());

  // AuthRepository authRepository;
  //
  // AuthCubit(this.authRepository) : super(AuthState()) {
  //   authRepository.authStatus.listen((event) {
  //     emitAuthState(event);
  //   });
  // }

  void emitAuthState(UserStreamSignal e) {}

  void init() {}

  void setUser(User? user) {}

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState(authState: AuthStateType.fromString(json['state']));
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return {"state": state.authState.getString()};
  }
}

enum AuthStateType {
  authenticated,
  blocked,
  unActivated,
  initial,
  unAuth;

  static AuthStateType fromString(String? state) {
    switch (state) {
      case 'authenticated':
        return AuthStateType.authenticated;
      case 'blocked':
        return AuthStateType.blocked;
      case 'unActivated':
        return AuthStateType.unActivated;
      case 'initial':
        return AuthStateType.initial;
      case 'unAuth':
        return AuthStateType.unAuth;
      default:
        return AuthStateType.initial;
    }
  }

  String getString() {
    switch (this) {
      case AuthStateType.authenticated:
        return 'authenticated';
      case AuthStateType.blocked:
        return 'blocked';
      case AuthStateType.unActivated:
        return 'unActivated';
      case AuthStateType.initial:
        return 'initial';
      case AuthStateType.unAuth:
        return 'unAuth';
    }
  }
}
