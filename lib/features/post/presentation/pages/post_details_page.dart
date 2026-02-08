import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/presentation/cubit/post_get_by_id_cubit.dart';
import 'package:dalil_hama/features/post/presentation/widget/post_scheme_card.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailsPage extends StatefulWidget {
  final String id;
  static final String path = "/PostDetailsPage/:id";

  const PostDetailsPage({super.key, required this.id});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  var cubit = getIt<PostGetByIdCubit>();

  @override
  void initState() {
    super.initState();
    cubit.get(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: BlocBuilder<PostGetByIdCubit, BaseState<Post>>(
          bloc: cubit,
          builder: (context, state) {
            return Text(state.item?.title ?? '');
          },
        ),
      ),
      body: ConsumerWidget(
        cubit: cubit,
        childBuilder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      16.height(),
                      ImageWidget(
                        url: state.imageUrl,
                        borderRadius: BorderRadius.circular(16),
                        width: double.infinity,
                        height: 250,
                      ),
                      16.height(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              state.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Icon(Icons.abc),
                        ],
                      ),
                      16.height(),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => PostSchemeCard(
                          schemaAttribute: state.attributes[index],
                        ),
                        separatorBuilder: (context, index) => 8.height(),
                        itemCount: state.attributes.length,
                      ),
                      16.height(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        onRetry: () => cubit.get(widget.id),
      ),
    );
  }
}
