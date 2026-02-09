import 'dart:async';

import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/repository/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostGetByIdCubit extends Cubit<BaseState<Post>> {
  PostRepository postRepository;
  StreamSubscription? streamSubscription;

  PostGetByIdCubit(this.postRepository) : super(BaseState()) {
    streamSubscription = postRepository.refreshStream.listen((v) {
      if (id != null) {
        get(id!);
      }
    });
  }

  String? id;

  void get(String id) async {
    this.id = id;
    emit(state.setInProgressState());
    var res = await postRepository.getPostsById(id);
    res.fold(
      (e) => emit(state.setFailureState(e)),
      (r) => emit(state.setSuccessState(r)),
    );
  }
}
