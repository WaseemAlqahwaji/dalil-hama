import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/generated/generated_assets/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthRegisterPage extends StatefulWidget {
  static String path = "/AuthRegisterPage";

  const AuthRegisterPage({super.key});

  @override
  State<AuthRegisterPage> createState() => _AuthRegisterPageState();
}

class _AuthRegisterPageState extends State<AuthRegisterPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  late TextEditingController usernameController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    usernameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(),
      bottomNavigationBar: SizedBox.shrink(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Assets.images.logoSvg.svg(),
                  24.height(),
                  Text(
                    context.translation.dalilHama,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  12.height(),
                  Text(
                    context.translation.letsGoIntoTheDalil,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  48.height(),
                  TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      label: Text(context.translation.fullname),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(
                        errorText: context.translation.fieldRequiredMessage,
                      ),
                    ]).call,
                  ),
                  16.height(),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      label: Text(context.translation.username),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(
                        errorText: context.translation.fieldRequiredMessage,
                      ),
                    ]).call,
                  ),
                  16.height(),

                  TextFormField(
                    controller: emailController,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      label: Text(context.translation.email),
                    ),
                    validator: (value) {
                      return EmailValidator(
                        errorText: context.translation.emailNotValid,
                      ).call(value);
                    },
                  ),

                  16.height(),
                  PasswordInputField(
                    passwordController: passwordController,
                    hasConfirmPassword: true,
                    passwordCheckColor: Theme.of(context).textTheme.labelMedium?.color,
                  ),
                  24.height(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(context.translation.register),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
