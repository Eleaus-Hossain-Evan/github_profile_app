import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import 'widgets.dart';

class NoDataWidget extends HookConsumerWidget {
  const NoDataWidget({
    super.key,
    this.text,
    this.margin,
  });

  final String? text;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        margin: margin,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: context.color.errorContainer,
          borderRadius: BorderRadius.circular(4.w),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_outlined,
              color: context.color.onErrorContainer,
            ),
            4.horizontalSpace,
            AppText(
              text ?? 'No Data',
              fontWeight: FontWeight.w800,
              color: context.color.onErrorContainer,
            ),
          ],
        ),
      ),
    );
  }
}
