import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import 'widgets.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: context.color.errorContainer,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            6.verticalSpace,
            Icon(
              Icons.error,
              color: context.color.error,
            ),
            12.verticalSpace,
            AppText(
              error.toString(),
              color: context.color.error,
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}
