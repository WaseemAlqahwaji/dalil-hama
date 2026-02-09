import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/auth/presentation/cubit/auth_reset_password_cubit.dart';
import 'package:dalil_hama/features/core/presentation/page/gradient_scaffold.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/core/presentation/widgets/dialogs/dialog_util.dart';
import 'package:dalil_hama/generated/generated_assets/assets.gen.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';

class AuthSendEmailPage extends StatefulWidget {
  static String path = "/AuthSendEmailPage";

  const AuthSendEmailPage({super.key});

  @override
  State<AuthSendEmailPage> createState() => _AuthSendEmailPageState();
}

class _AuthSendEmailPageState extends State<AuthSendEmailPage> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  var cubit = getIt<AuthResetPasswordCubit>();

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(),
      bottomNavigationBar: SizedBox.shrink(),
      body: Form(
        key: key,
        child: Container(
          constraints: const BoxConstraints.expand(),
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
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text(context.translation.email),
                    ),
                    validator: (value) {
                      return EmailValidator(
                        errorText: context.translation.emailNotValid,
                      ).call(value);
                    },
                  ),

                  24.height(),
                  SizedBox(
                    width: double.infinity,
                    child: ScreenLoader(
                      useRoot: true,
                      cubit: cubit,
                      onSuccess: (c) {
                        PopUps(context: context).showSuccessDialog(
                          message: context
                              .translation
                              .weSendResetPasswordLinkToYourEmail,
                        );
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          // PopUps(context: context).showSuccessDialog(
                          //   message: context
                          //       .translation
                          //       .weSendResetPasswordLinkToYourEmail,
                          // );
                          // return;
                          if (!key.currentState!.validate()) {
                            return;
                          }
                          cubit.reset(emailController.text);
                        },
                        child: Text(context.translation.sendMail),
                      ),
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
