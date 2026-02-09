import 'package:dalil_hama/features/auth/presentation/page/auth_login_page.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginFirstDialog extends StatefulWidget {
  const LoginFirstDialog({super.key});

  @override
  State<LoginFirstDialog> createState() => _LoginFirstDialogState();
}

class _LoginFirstDialogState extends State<LoginFirstDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.translation.login),
      content: Text(context.translation.pleaseLoginFirst),
      actions: [
        ElevatedButton(
          onPressed: () {
            context.pop();
            context.push(AuthLoginPage.path);
          },
          child: Text(context.translation.login),
        ),
      ],
    );
  }
}
