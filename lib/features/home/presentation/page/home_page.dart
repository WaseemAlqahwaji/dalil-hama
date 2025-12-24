import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/post/presentation/pages/posts_page.dart';
import 'package:dalil_hama/features/services/domain/entity/service.dart';
import 'package:dalil_hama/generated/generated_assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  static final String path = "/HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translation.home), actions: []),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWellWithoutFeedback(
              onTap: () {
                // context.pushNamed(SearchPage.path);
                context.pushNamed(
                  PostsPage.path,
                  extra: Service(
                    serviceId: "5763501d-7cf2-452f-9de9-dc86500ad32f",
                    slug: "restaurants",
                  ),
                );
              },
              child: TextFormField(
                enabled: false,
                onTap: () {},
                decoration: InputDecoration(
                  hint: Text(context.translation.searchForAnything),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Assets.icons.search.svg(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
