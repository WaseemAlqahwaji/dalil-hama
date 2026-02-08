import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static String path = "/SplashPage";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((e){
    //   context.go(AuthLoginPage.path);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     PostGetParams params = PostGetParams(slug: "pharmacies" , first: 10);
      //     Dio dio = Dio();
      //     dio.interceptors.add(
      //       UnifiInterceptor(
      //         request: true,
      //         responseBody: true,
      //         requestBody: true,
      //         requestHeader: true,
      //         responseHeader: true,
      //         usePrint: false,
      //       ),
      //     );
      //     dio.post(
      //       "http://10.0.2.2:5001/graphql",
      //       data: {
      //         "query" : params.getGraphQlQuery(),
      //       },
      //     );
      //   },
      // ),
    );
  }
}
