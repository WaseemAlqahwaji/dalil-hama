import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:go_router/go_router.dart';

class PostRatingSheet extends StatefulWidget {
  final String id;
  final ValueChanged<double> onDone;

  const PostRatingSheet({super.key, required this.id, required this.onDone});

  @override
  State<PostRatingSheet> createState() => _PostRatingSheetState();
}

class _PostRatingSheetState extends State<PostRatingSheet> {
  double v = 1;

  @override
  Widget build(BuildContext context) {
    return RegularBottomSheetLayout(
      title: context.translation.ratings,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            16.height(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: StarRating(
                size: 32,
                rating: v,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                onRatingChanged: (V) {
                  setState(() {
                    v = V;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      onDone: () {
        context.pop();
        widget.onDone(v);
      },
    );
  }
}
