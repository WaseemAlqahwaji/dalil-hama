import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/widgets/bloc_consumers/list_view_pagination_widget.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';
import 'package:dalil_hama/features/post/presentation/cubit/posts_get_cubit.dart';
import 'package:dalil_hama/features/post/presentation/widget/post_card.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';

class PostListWidget extends StatefulWidget {
  final PostGetParams params;
  final PostsGetCubit cubit;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final bool shrinkWrap;

  const PostListWidget({
    super.key,
    required this.params,
    required this.cubit,
    this.scrollController,
    this.scrollPhysics,
    this.shrinkWrap = false,
  });

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  final cubit = getIt<PostsGetCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListViewPaginationWidget<Post>(
      autoDispose: false,
      paginationCubit: widget.cubit,
      scrollPhysics: widget.scrollPhysics,
      scrollController: widget.scrollController,
      shrinkWrap: widget.shrinkWrap,
      params: widget.params,
      itemBuilder: (data) {
        return Column(
          children: [
            PostCard(post: data),
            16.height(),
          ],
        );
      },
    );
  }
}
