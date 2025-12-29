import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/core/presentation/widgets/bloc_consumers/consumer_widget.dart';
import 'package:dalil_hama/features/core/presentation/widgets/main_app_bar.dart';
import 'package:dalil_hama/features/search/presentation/page/search_page.dart';
import 'package:dalil_hama/features/sections/presentation/cubit/section_get_cubit.dart';
import 'package:dalil_hama/features/sections/presentation/widgets/section_widget.dart';
import 'package:dalil_hama/generated/generated_assets/assets.gen.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  static final String path = "/HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sectionCubit = getIt<SectionGetCubit>();

  @override
  void initState() {
    sectionCubit.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Row(
      //         children: [
      //           Icon(Icons.location_on),
      //           Text(context.translation.dalilHama),
      //         ],
      //       ),
      //       Text(
      //         context.translation.selectSection,
      //         style: Theme.of(context).textTheme.bodySmall,
      //       ),
      //     ],
      //   ),
      //   actions: [],
      // ),
      appBar: MainAppBar(
        titleText: context.translation.dalilHama,
        description: context.translation.selectSection,
        icon: Icon(Icons.location_on),
        // actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // InkWellWithoutFeedback(
            //   onTap: () {
            //     context.pushNamed(SearchPage.path);
            //   },
            //   child: TextFormField(
            //     enabled: false,
            //     onTap: () {},
            //     decoration: InputDecoration(
            //       hint: Text(context.translation.searchForAnything),
            //       prefixIcon: Padding(
            //         padding: const EdgeInsets.all(16),
            //         child: Assets.icons.search.svg(),
            //       ),
            //     ),
            //   ),
            // ),
            // 24.height(),
            Row(
              children: [
                Assets.icons.sections.svg(),
                8.width(),
                Expanded(
                  child: Text(
                    context.translation.mainSections,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            16.height(),
            // Flexible(
            //   child: GridView.count(

            //     crossAxisCount: 2,
            //     crossAxisSpacing: 8,
            //     children: [SectionWidget(), SectionWidget(), SectionWidget()],
            //   ),
            // ),
            Expanded(
              child: ConsumerWidget(
                cubit: sectionCubit,
                childBuilder: (context, t) => GridView.builder(
                  itemBuilder: (context, index) =>
                      SectionWidget(section: t[index]),
                  itemCount: t.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 160,
                    mainAxisSpacing: 8,
                  ),
                ),
                onRetry: sectionCubit.get,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
