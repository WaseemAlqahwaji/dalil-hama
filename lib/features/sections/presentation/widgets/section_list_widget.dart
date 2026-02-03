import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/post/presentation/pages/posts_page.dart';
import 'package:dalil_hama/features/sections/domain/entity/section.dart';
import 'package:dalil_hama/features/sections/domain/params/section_get_params.dart';
import 'package:dalil_hama/features/sections/presentation/cubit/section_get_cubit.dart';
import 'package:dalil_hama/features/sections/presentation/widgets/section_widget.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SectionListWidget extends StatefulWidget {
  const SectionListWidget({super.key, required this.canBack});

  final ValueChanged<bool> canBack;

  @override
  State<SectionListWidget> createState() => _SectionListWidgetState();
}

class _SectionListWidgetState extends State<SectionListWidget> {
  int stack = 0;
  List<Section> selected = [];
  final params = SectionGetParams(level: 2);
  final cubit = getIt<SectionGetCubit>();

  Section? getSelected() {
    if (stack == 0) {
      return null;
    }
    return selected[stack - 1];
  }

  void back() {
    selected.removeAt(stack - 1);
    stack--;
    setState(() {});
    cubit.get(params: SectionGetParams(parentId: getSelected()?.id, level: 2));
    widget.canBack(selected.isNotEmpty);

  }

  void front(Section section) {
    selected.add(section);
    stack++;
    setState(() {});
    cubit.get(params: SectionGetParams(parentId: section.id, level: 2));
    widget.canBack(selected.isNotEmpty);
  }

  @override
  void initState() {
    super.initState();
    cubit.get(params: params);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: stack == 0,
      onPopInvokedWithResult: (a, b) async {
        back();
      },
      child: ConsumerWidget(
        cubit: cubit,
        childBuilder: (context, items) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 16),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 200,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWellWithoutFeedback(
                onTap: () {
                  // print(items[index].title);
                  // print(items[index].children);
                  if (items[index].children.isEmpty) {
                    context.pushNamed(PostsPage.path , extra: items[index].slug);
                  } else {
                    front(items[index]);
                  }
                },
                child: SectionWidget(section: items[index]),
              );
            },
          );
        },
        onRetry: () {
          cubit.get(params: params);
        },
      ),
    );
  }
}
