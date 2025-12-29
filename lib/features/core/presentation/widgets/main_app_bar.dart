import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  final String titleText;
  final String? description;
  final Widget? icon;

  MainAppBar({
    super.key,
    required this.titleText,
    this.description,
    this.icon,
    super.actions,
  });

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.icon,
      // leadingWidth: 40,
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.titleText),
          if (widget.description != null)
            Text(
              widget.description!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
        ],
      ),
    );
  }
}
