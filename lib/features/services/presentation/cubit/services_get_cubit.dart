import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/services/domain/entity/service.dart';
import 'package:dalil_hama/features/services/domain/repository/services_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ServicesGetCubit extends Cubit<BaseState<List<KService>>> {
  final ServicesRepository servicesRepository;

  ServicesGetCubit(this.servicesRepository) : super(BaseState());

  void get({required String sectionId}) async {
    if (state.isSuccess) {
      emit(state);
      return;
    }
    emit(state.setInProgressState());
    var res = await servicesRepository.getServices(sectionId: sectionId);
    res.fold(
      (e) => emit(state.setFailureState(e)),
      (r) => emit(state.setSuccessState(r)),
    );
  }
}
