import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GradientScaffold extends Scaffold {
  const GradientScaffold({
    super.key,
    super.appBar,
    super.body,
    super.bottomNavigationBar,
    super.extendBodyBehindAppBar = true,
    super.floatingActionButton,
  });

  @override
  ScaffoldState createState() => _GradientScaffoldState();
}

class _GradientScaffoldState extends ScaffoldState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomNavigationBar,
      backgroundColor: Colors.transparent,
      appBar: widget.appBar,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      extendBody: true,
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: Theme.of(
                    context,
                  ).appSchema.appGradients.scaffoldGradient,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              // top: kToolbarHeight + 64,
              top: widget.appBar?.preferredSize.height != null
                  ? widget.appBar!.preferredSize.height + 24
                  : widget.appBar == null
                  ? 0
                  : kToolbarHeight + 64,
              child: widget.body ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
