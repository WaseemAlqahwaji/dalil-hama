import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/domain/entity/page_gpl.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';
import 'package:dalil_hama/features/post/domain/repository/post_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostsGetCubit extends PaginationCubit<Post, PostGetParams> {
  PostsGetCubit(this.postRepository) : super(BasePaginatedListState());
  PostRepository postRepository;
  PageGpl? pageGpl;
  late PostGetParams params;

  @override
  void get({PostGetParams? params}) async {
    pageGpl = null;
    this.params = PostGetParams(
      slug: params!.slug,
      title: params.title,
      first: params.first,
      after: params.after,
      serviceId: params.serviceId,
    );
    emit(state.setInProgressState());
    final result = await postRepository.getPosts(params);
    result.fold((l) => emit(state.setFailureState(l)), (r) {
      pageGpl = r.pageInfo;
      emit(
        state.setSuccessState(
          r.post,
          r.pageInfo.hasNextPage ? r.post.length + 1 : r.post.length,
        ),
      );
    });
  }

  @override
  void paginate() async {
    params.after = pageGpl?.endCursor;
    emit(state.setPaginateInProgressState());
    var res = await postRepository.getPosts(params);
    res.fold((e) => emit(state.setPaginateFailureState(e)), (r) {
      pageGpl = r.pageInfo;
      var items = [...state.items, ...r.post];
      emit(
        state.setSuccessState(
          items,
          pageGpl!.hasNextPage ? items.length + 1 : items.length,
        ),
      );
    });
  }
}
