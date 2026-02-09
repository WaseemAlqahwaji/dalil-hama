import 'package:core_package/core_package.dart';
import 'package:core_package/generated/core_translation/core_translations.dart';
import 'package:dalil_hama/features/core/presentation/widgets/dialogs/message_dialog.dart';
import 'package:flutter/material.dart';

import 'loading_dialog.dart';

class PopUps {
  BuildContext context;
  final bool canPop;
  final VoidCallback? onShow, onAccept, onCancel;

  PopUps({
    required this.context,
    this.canPop = true,
    this.onAccept,
    this.onShow,
    this.onCancel,
  });

  Future<void> showLoadingDialog({bool? root}) async {
    onShow?.call();
    await showDialog(
      context: context,
      useRootNavigator: root ?? false,
      builder: (context) => const LoadingDialog(),
      barrierDismissible: false,
    );
    onAccept?.call();
  }

  Future<void> showSuccessDialog({String? message}) async {
    onShow?.call();
    await showDialog(
      context: context,
      builder: (context) {
        return MessageDialog(message: message,);
      },
    );
    onAccept?.call();
  }

  Future<void> showFailDialog({
    Failure? failure,
    bool isFloating = false,
  }) async {
    onShow?.call();
    String message =
        failure?.getError(context) ??
        CoreTranslations.of(context)!.errorMessage;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.start,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: isFloating ? SnackBarBehavior.floating : null,
      ),
    );
  }

  // Future<void> showConfirmDialog({
  //   required String title,
  //   required String message,
  //   String? acceptText,
  //   String? cancelText,
  //   Widget? icon,
  // }) async {
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return ConfirmDialog(
  //         icon: icon,
  //         onCancel: onCancel,
  //         title: title,
  //         acceptText: acceptText,
  //         cancelText: cancelText,
  //         onAccept: () {
  //           onAccept?.call();
  //         },
  //         message: message,
  //       );
  //     },
  //   );
  // }
  //
  // Future<void> showMessageDialog({
  //   required String title,
  //   required String message,
  //   Widget? icon,
  // }) async {
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return MessageDialog(icon: icon, title: title, message: message);
  //     },
  //   );
  // }

  Future<void> showCustomDialog({required Widget widget}) async {
    onShow?.call();
    await showDialog(
      context: context,
      builder: (context) {
        return widget;
      },
    );
  }
}
