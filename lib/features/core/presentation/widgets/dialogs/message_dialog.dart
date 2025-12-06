// import 'package:core_package/core_package.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:tashkela_app/features/core/presentation/utils/ext/tr.dart';
//
// class MessageDialog extends StatefulWidget {
//   final String message;
//   final String title;
//   final Widget? icon;
//
//   const MessageDialog({
//     super.key,
//     required this.message,
//     required this.title,
//     this.icon,
//   });
//
//   @override
//   State<MessageDialog> createState() => _MessageDialogState();
// }
//
// class _MessageDialogState extends State<MessageDialog> {
//   @override
//   Widget build(BuildContext context) {
//     Theme.of(context).appColor;
//     return AlertDialog(
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (widget.icon != null) ...[16.height(), widget.icon!, ],
//           16.height(),
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
//           16.height(),
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: ElevatedButton(
//               onPressed: () {
//                 context.pop();
//               },
//               child: Text(context.translation.accept),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Theme.of(context).cardColor,
//       actionsAlignment: MainAxisAlignment.spaceBetween,
//     );
//   }
// }
