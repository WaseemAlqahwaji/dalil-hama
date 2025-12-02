// import 'package:core_package/core_package.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:tashkela_app/features/core/presentation/utils/ext/tr.dart';
//
// class ConfirmDialog extends StatefulWidget {
//   final VoidCallback onAccept;
//   final VoidCallback? onCancel;
//   final String message;
//   final String title;
//   final String? acceptText;
//   final String? cancelText;
//   final Widget? icon;
//
//   const ConfirmDialog({
//     super.key,
//     required this.onAccept,
//     this.onCancel,
//     required this.message,
//     this.acceptText,
//     required this.title,
//     this.cancelText,
//     this.icon,
//   });
//
//   @override
//   State<ConfirmDialog> createState() => _ConfirmDialogState();
// }
//
// class _ConfirmDialogState extends State<ConfirmDialog> {
//   @override
//   Widget build(BuildContext context) {
//     Theme.of(context).appColor;
//     return AlertDialog(
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (widget.icon != null) ...[16.height(), widget.icon!, 16.height()],
//           Container(
//             width: MediaQuery.of(context).size.width,
//             alignment: Alignment.center,
//             child: Text(
//               widget.title,
//               style: Theme.of(context).dialogTheme.titleTextStyle,
//             ),
//           ),
//           16.height(),
//           Text(
//             widget.message,
//             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               fontSize: 14,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Theme.of(context).cardColor,
//       actionsAlignment: MainAxisAlignment.spaceBetween,
//       actions: [
//         SizedBox(
//           width: 120,
//           child: ElevatedButton(
//             onPressed: () {
//               widget.onAccept.call();
//               context.pop();
//             },
//             child: Text(
//               widget.acceptText ?? context.translation.accept,
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 120,
//           child: OutlinedButton(
//             onPressed: () {
//               widget.onCancel?.call();
//               context.pop();
//             },
//             child: Text(
//               widget.cancelText ?? context.translation.cancel,
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
