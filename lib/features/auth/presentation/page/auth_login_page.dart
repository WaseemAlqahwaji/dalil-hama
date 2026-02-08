import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/auth/domain/params/auth_login_params.dart';
import 'package:dalil_hama/features/auth/presentation/cubit/auth_login_cubit.dart';
import 'package:dalil_hama/features/auth/presentation/page/auth_register_page.dart';
import 'package:dalil_hama/features/auth/presentation/page/auth_send_email_page.dart';
import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/generated/generated_assets/assets.gen.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthLoginPage extends StatefulWidget {
  static String path = "/AuthLoginPage";

  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var params = AuthLoginParams();
  var k = GlobalKey<FormState>();
  var cubit = getIt<AuthLoginCubit>();

  @override
  void initState() {
    emailController = TextEditingController(text: kDebugMode ? "bob" : "");
    passwordController = TextEditingController(
      text: kDebugMode ? "Pass123\$" : "",
    );
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      bottomNavigationBar: SizedBox.shrink(),
      body: ScreenLoader(
        cubit: cubit,
        child: Form(
          key: k,
          child: Container(
            constraints: const BoxConstraints.expand(),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Assets.images.logo.svg(),
                      24.height(),
                      Text(
                        context.translation.dalilHama,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      12.height(),
                      Text(
                        context.translation.yourFirstOptionToKnowHamaOmAlfidaa,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      48.height(),
                      TextFormField(
                        controller: emailController,
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          label: Text(context.translation.username),
                        ),
                        validator: (value) {
                          return RequiredValidator(
                            errorText: context.translation.fieldRequiredMessage,
                          ).call(value);
                        },
                      ),

                      16.height(),
                      PasswordInputField(
                        passwordController: passwordController,
                      ),

                      24.height(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!k.currentState!.validate()) {
                              return;
                            }
                            params.username = emailController.text;
                            params.password = passwordController.text;
                            cubit.login(params);
                          },
                          child: Text(context.translation.login),
                        ),
                      ),
                      Row(
                        children: [
                          Text(context.translation.forgetPassword),
                          TextButton(
                            onPressed: () {
                              context.pushNamed(AuthSendEmailPage.path);
                            },
                            child: Text(context.translation.restore),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(context.translation.dontHaveAnAccount),
                          TextButton(
                            onPressed: () {
                              context.pushNamed(AuthRegisterPage.path);
                            },
                            child: Text(context.translation.register),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
