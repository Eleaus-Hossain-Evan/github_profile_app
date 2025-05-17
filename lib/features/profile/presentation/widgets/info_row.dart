import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common/widgets/widgets.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.grey, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: AppText(text, fontSize: 15),
          ),
        ].animate(delay: 800.ms).fadeIn(),
      ),
    );
  }
}

class InfoRowLoader extends StatelessWidget {
  const InfoRowLoader({super.key, this.words = 10});
  final int words;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Bone.icon(size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Bone.text(fontSize: 15, words: words),
          ),
        ],
      ),
    );
  }
}
