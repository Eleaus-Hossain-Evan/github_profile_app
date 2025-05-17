import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common/widgets/widgets.dart';

class StatColumn extends StatelessWidget {
  const StatColumn({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AppText(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ).animate(delay: 600.ms).fadeIn().slideY(begin: .2, end: 0),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: AppText(
            label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
          ).animate(delay: 600.ms).fadeIn().slide(begin: Offset(0, -0.5), end: Offset(0, 00)),
        ),
      ],
    );
  }
}

class StatColumnLoader extends StatelessWidget {
  const StatColumnLoader({
    super.key,
    required this.label,
    required this.value,
  });

  final double label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Bone.text(
          fontSize: 20,
          width: value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: Bone.text(
            fontSize: 15,
            width: label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
