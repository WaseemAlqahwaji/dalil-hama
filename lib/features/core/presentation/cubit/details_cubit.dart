import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_states/base_state.dart';

abstract class DetailsCubit<T, Params> extends Cubit<BaseState<T>> {
  DetailsCubit(super.initialState);

  void execute({Params? params});
}
