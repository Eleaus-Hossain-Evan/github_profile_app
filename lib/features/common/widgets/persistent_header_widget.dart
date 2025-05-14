import 'package:flutter/material.dart';

class PersistentHeaderWidget extends SliverPersistentHeaderDelegate {
  final Widget Function(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) builder;
  final double minHeight;
  final double maxHeight;

  PersistentHeaderWidget({
    required this.builder,
    required this.minHeight,
    required this.maxHeight,
  });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(context, shrinkOffset, overlapsContent);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
