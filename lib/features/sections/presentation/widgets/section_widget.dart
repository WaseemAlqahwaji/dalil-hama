import 'package:core_package/core_package.dart';
import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SectionWidget extends StatefulWidget {
  const SectionWidget({super.key});

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 4,
                color: Theme.of(context).appSchema.shapeColor.borderColor,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).appSchema.shapeColor.navBar,
                        ),
                        child: Icon(Icons.wallet),
                      ),
                      8.width(),
                      Expanded(
                        child: Text(
                          "القطاع الصحي والطبي",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                8.height(),
                Expanded(child: Text("description")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
