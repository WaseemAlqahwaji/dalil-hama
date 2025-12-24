import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/core/presentation/widgets/bloc_consumers/list_view_pagination_widget.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';
import 'package:dalil_hama/features/post/presentation/cubit/posts_get_cubit.dart';
import 'package:dalil_hama/features/post/presentation/widget/post_card.dart';
import 'package:dalil_hama/features/services/domain/entity/service.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  static String path = "/PostsPage";
  final KService service;

  const PostsPage({super.key, required this.service});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final cubit = getIt<PostsGetCubit>();
  late PostGetParams params;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    params = PostGetParams(
      slug: widget.service.slug,
      first: 10,
      serviceId: widget.service.serviceId,
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(title: Text(context.translation.advertisements)),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              4.height(),
              SearchTextField(
                onChanged: (v) {
                  params.title = v.valOrNull;
                  cubit.get(params: params);
                },
              ),
              16.height(),
              ListViewPaginationWidget<Post>(
                paginationCubit: cubit,
                shrinkWrap: true,
                scrollController: scrollController,
                scrollPhysics: NeverScrollableScrollPhysics(),
                params: params,
                itemBuilder: (data) {
                  return Column(
                    children: [
                      PostCard(post: data),
                      16.height(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
