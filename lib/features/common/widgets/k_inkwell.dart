import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class KInkWell extends StatelessWidget {
  const KInkWell({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.radius,
    this.rippleColor,
    this.padding,
    this.backgroundColor = Colors.transparent,
    this.shape,
  });

  final VoidCallback? onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? rippleColor, backgroundColor;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      // borderRadius: borderRadius ?? BorderRadius.circular(4.r),
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(4.r),
          ),
      child: InkWell(
        onTap: onTap,
        customBorder: shape ??
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(4.r),
            ),
        // borderRadius: borderRadius ?? BorderRadius.zero,
        radius: radius,
        highlightColor: context.color.primary.withOpacity(.12),
        splashColor: rippleColor?.withOpacity(.12) ??
            context.color.primary.withOpacity(.12),
        // overlayColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.hovered)) {
        //     return rippleColor?.withOpacity(.12) ??
        //         context.color.onPrimaryContainer.withOpacity(0.12);
        //   }
        //   if (states.contains(MaterialState.focused)) {
        //     return rippleColor?.withOpacity(.12) ??
        //         context.color.onPrimaryContainer.withOpacity(0.12);
        //   }
        //   if (states.contains(MaterialState.pressed)) {
        //     return rippleColor?.withOpacity(.12) ??
        //         context.color.onPrimaryContainer.withOpacity(0.12);
        //   }
        //   if (states.contains(MaterialState.selected)) {
        //     return rippleColor?.withOpacity(.12) ??
        //         context.color.onPrimaryContainer.withOpacity(0.12);
        //   }
        //   return null;
        // }),
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 4.w),
          child: child,
        ),
      ),
    );
  }
}
