import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import 'widgets.dart';

class KTitleText extends StatelessWidget {
  const KTitleText({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          fontSize: 12,
          height: 1.33,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        5.verticalSpace,
        AppText(
          text,
          fontSize: 12,
          height: 1.4,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w500,
          color: Color(0xFF5E5E5E),
        ),
      ],
    );
  }
}
