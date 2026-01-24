import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/core/presentation/widgets/main_app_bar.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';
import 'package:dalil_hama/features/post/presentation/cubit/posts_get_cubit.dart';
import 'package:dalil_hama/features/post/presentation/widget/post_list_widget.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  static String path = "/PostsPage";
  final String? slug;

  const PostsPage({super.key, this.slug});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final postCubit = getIt<PostsGetCubit>();
  late PostGetParams params;
  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    params = PostGetParams(slug: widget.slug);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: MainAppBar(titleText: context.translation.advertisements),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              SearchTextField(
                controller: controller,
                onChanged: (v) {
                  params.title = v.valOrNull;
                  postCubit.get(params: params);
                },
              ),
              16.height(),
              PostListWidget(
                cubit: postCubit,
                shrinkWrap: true,
                scrollController: scrollController,
                scrollPhysics: NeverScrollableScrollPhysics(),
                params: params,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
