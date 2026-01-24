import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:dalil_hama/features/sections/domain/params/section_get_params.dart';
import 'package:dalil_hama/features/sections/domain/repository/sections_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SectionGetCubit extends Cubit<BaseState<List<Section>>> {
  final SectionsRepo sectionRepository;

  SectionGetCubit(this.sectionRepository) : super(BaseState());

  void get({required SectionGetParams params}) async {
    emit(state.setInProgressState());
    var res = await sectionRepository.getSections(params: params);
    res.fold(
      (e) => emit(state.setFailureState(e)),
      (r) => emit(state.setSuccessState(r)),
    );
  }
}
