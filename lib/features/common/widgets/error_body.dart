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
      child: Chip(
        backgroundColor: context.color.errorContainer,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        side: BorderSide(
          color: context.color.errorContainer,
        ),
        avatar: Icon(
          Icons.error,
          color: context.color.error,
        ),
        label: AppText(
          error.toString(),
          color: context.color.error,
        ),
      ),
    );
  }
}
