import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:core_package/core_package.dart';
import 'package:core_package/generated/core_translation/core_translations.dart';
import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/core/presentation/widgets/bloc_consumers/consumer_widget.dart';
import 'package:dalil_hama/features/core/presentation/widgets/main_app_bar.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';
import 'package:dalil_hama/features/post/presentation/cubit/posts_get_cubit.dart';
import 'package:dalil_hama/features/post/presentation/widget/post_list_widget.dart';
import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:dalil_hama/features/services/domain/entity/service.dart';
import 'package:dalil_hama/features/services/presentation/cubit/services_get_cubit.dart';
import 'package:dalil_hama/features/services/presentation/widget/service_chip_list.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  static String path = "/PostsPage";
  final Section section;

  const PostsPage({super.key, required this.section});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final postCubit = getIt<PostsGetCubit>();
  final serviceCubit = getIt<ServicesGetCubit>();
  late PostGetParams params;
  ScrollController scrollController = ScrollController();
  KService? selectedService;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    serviceCubit.get(sectionId: widget.section.id);
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
      appBar: MainAppBar(
        titleText: context.translation.advertisements,
        description:
            "${context.translation.discover} ${widget.section.description}",
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ConsumerWidget(
          onDataReceived: (v) {
            if (v.firstOrNull != null) {
              selectedService = v.first;
              controller.clear();
              params = PostGetParams(
                slug: selectedService!.slug,
                first: 10,
                serviceId: selectedService!.serviceId,
              );
              setState(() {});
            }
          },
          cubit: serviceCubit,
          onRetry: () {
            serviceCubit.get(sectionId: widget.section.id);
          },
          childBuilder: (context, t) {
            return Column(
              children: [
                ServiceChipList(
                  services: t,
                  selected: selectedService,
                  onChange: (service) {
                    selectedService = service;
                    controller.clear();
                    params = PostGetParams(
                      slug: selectedService!.slug,
                      first: 10,
                      serviceId: selectedService!.serviceId,
                    );
                    setState(() {});
                  },
                ),
                ConditionalBuilder(
                  builder: (context) => Flexible(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          4.height(),
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
                  condition: selectedService != null,
                  fallback: (context) => Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          CoreTranslations.of(context)!.noData,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
