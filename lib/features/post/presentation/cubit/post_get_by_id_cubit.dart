import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/repository/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostGetByIdCubit extends Cubit<BaseState<Post>> {
  PostRepository postRepository;

  PostGetByIdCubit(this.postRepository) : super(BaseState());

  void get(String slug, String id) async {
    emit(state.setInProgressState());
    var res = await postRepository.getPostsById(slug, id);
    res.fold(
      (e) => emit(state.setFailureState(e)),
      (r) => emit(state.setSuccessState(r)),
    );
  }
}
