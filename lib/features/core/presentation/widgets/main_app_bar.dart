import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  MainAppBar({
    super.key,
    required String title,
    required String description,
    super.actions,
    IconData? icon,
  }) : super(
         title: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 icon != null ? Icon(icon) : SizedBox.shrink(),
                 Expanded(child: Text(title)),
               ],
             ),
             Text(description),
             
           ],
         ),
       );
}
