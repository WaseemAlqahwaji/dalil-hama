import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/core/presentation/utils/map_lancher.dart';
import 'package:dalil_hama/features/core/presentation/widgets/dialogs/dialog_util.dart';
import 'package:dalil_hama/features/core/presentation/widgets/dialogs/login_first_dialog.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/repository/post_repository.dart';
import 'package:dalil_hama/features/post/presentation/cubit/post_get_by_id_cubit.dart';
import 'package:dalil_hama/features/post/presentation/widget/post_rating_sheet.dart';
import 'package:dalil_hama/features/post/presentation/widget/post_scheme_card.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ConsumerWidget(
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
                        if (state.location != null) ...[
                          Stack(
                            children: [
                              MapWidget(
                                height: 200,
                                ignore: true,
                                width: double.infinity,
                                latLng: LatLng(
                                  state.location!.latitude,
                                  state.location!.longitude,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: TextButton(
                                  child: Text(context.translation.showInMap),
                                  onPressed: () async {
                                    await openMap(
                                      state.location!.latitude,
                                      state.location!.longitude,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          16.height(),
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                state.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ],
                        ),
                        16.height(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                context.translation.ratings,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.star),
                              onPressed: () {
                                if (getIt<AuthCubit>().state.authenticated) {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => PostRatingSheet(
                                      id: state.id,
                                      onDone: (v) {
                                        getIt<PostRepository>().rate(
                                          state.id,
                                          v,
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  PopUps(context: context).showCustomDialog(
                                    widget: LoginFirstDialog(),
                                  );
                                }
                              },
                            ),
                            Text(
                              "5/${state.ratingAvg.toStringAsFixed(1)}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        16.height(),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (state.attributes[index].execluded) {
                              return const SizedBox.shrink();
                            }

                            return Column(
                              children: [
                                PostSchemeCard(
                                  schemaAttribute: state.attributes[index],
                                ),
                                16.height(),
                              ],
                            );
                          },
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
      ),
    );
  }
}
