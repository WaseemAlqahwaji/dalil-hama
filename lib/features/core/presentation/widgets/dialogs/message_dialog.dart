import 'package:core_package/generated/core_translation/core_translations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessageDialog extends StatefulWidget {
  final String? message;
  final Widget? icon;

  const MessageDialog({super.key, required this.message, this.icon});

  @override
  State<MessageDialog> createState() => _MessageDialogState();
}

class _MessageDialogState extends State<MessageDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(16),
      // title: Text(CoreTranslations.of(context)!.success),
      content: Text(
        widget.message ?? CoreTranslations.of(context)!.success,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),

      actions: [
        ElevatedButton(
          onPressed: () {
            context.pop();
            // context.push(AuthLoginPage.path);
          },
          child: Text(CoreTranslations.of(context)!.done),
        ),
      ],
    );
  }
}
