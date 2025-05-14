import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import 'widgets.dart';

class KIconElevatedButton extends HookConsumerWidget {
  const KIconElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.loading = false,
  });

  final String text;
  final Widget icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final bool? loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
        // shape: MaterialStateProperty.all(
        //   RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.r),
        //   ),
        // ),
        minimumSize: WidgetStateProperty.all(Size.fromHeight(55.h)),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        foregroundColor: WidgetStateProperty.all(foregroundColor),
      ),
      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  foregroundColor ?? Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          : Row(
              children: [
                Expanded(child: Center(child: Text(text))),
                Material(
                  elevation: 4,
                  color: backgroundColor ?? Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(100.r),
                  child: Padding(
                    padding: EdgeInsets.all(6.w),
                    child: icon,
                  ),
                ),
              ],
            ),
    );
  }
}

class KElevatedButton extends HookConsumerWidget {
  const KElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.loading,
    this.child,
    this.isSecondary,
    this.textStyle,
    this.size,
    this.padding,
  });

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final bool? loading;
  final Widget? child;
  final bool? isSecondary;
  final TextStyle? textStyle;
  final Size? size;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      // style: ButtonStyle(
      //   minimumSize: MaterialStateProperty.all(size ?? Size.fromHeight(55.h)),
      //   textStyle: MaterialStateProperty.all(textStyle),
      //   backgroundColor: MaterialStateProperty.resolveWith<Color>(
      //       (Set<MaterialState> states) {
      //     if (states.contains(MaterialState.disabled)) {
      //       return context.theme.disabledColor;
      //     }
      //     return backgroundColor ??
      //         (isSecondary
      //             ? context.color.secondary
      //             : context.color.primary); // Use the component's default.
      //   }),
      //   foregroundColor:
      //       MaterialStateProperty.all(foregroundColor ?? Colors.white),
      //   overlayColor: MaterialStateProperty.all(
      //     isSecondary ? context.color.secondary : context.color.primary,
      //   ),
      // ),
      style: ElevatedButton.styleFrom(
        textStyle: textStyle ??
            TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              // color: isSecondary == null
              //     ? AppColors.text200
              //     : (isSecondary!
              //         ? AppColors.secondary200
              //         : AppColors.primary300),
            ),
        foregroundColor:
            isSecondary == null ? AppColors.white : (isSecondary! ? AppColors.textParagraph : AppColors.white),
        backgroundColor: backgroundColor ?? AppColors.textHint,
        padding: padding,
        minimumSize: size,
      ),
      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  isSecondary == null
                      ? AppColors.text
                      : (isSecondary! ? context.color.onSecondaryContainer : context.color.onPrimaryContainer),
                ),
              ),
            )
          : child ??
              Text(
                text,
              ),
    );
  }
}

class KOutlinedButton extends HookConsumerWidget {
  const KOutlinedButton({
    super.key,
    this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor = AppColors.primary,
    this.borderWidth,
    required this.onPressed,
    this.loading,
    this.textStyle,
    this.size,
    this.isSecondary = true,
    this.child,
    this.borderSide,
    this.borderStyle,
    this.padding,
    this.shape,
    this.borderRadius = BorderRadius.zero,
  });

  final String? text;
  final Color? backgroundColor, foregroundColor;
  final Color borderColor;
  final double? borderWidth;
  final VoidCallback? onPressed;
  final ValueNotifier<bool>? loading;
  final TextStyle? textStyle;
  final Size? size;
  final bool isSecondary;
  final Widget? child;
  final BorderSide? borderSide;
  final BorderStyle? borderStyle;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: padding,
        textStyle: textStyle ??
            TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: foregroundColor ?? (isSecondary ? AppColors.primary : AppColors.primary),
            ),
        foregroundColor: foregroundColor ?? (isSecondary ? AppColors.primary : AppColors.primary),
        backgroundColor: backgroundColor,
        side: BorderSide(
          color: isSecondary ? AppColors.primary : borderColor,
          width: borderWidth ?? 1,
          style: borderStyle ?? BorderStyle.solid,
        ),
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
        minimumSize: size,
      ),
      onPressed: onPressed,
      child: (loading != null && loading!.value)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  foregroundColor ?? Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          : child ?? Text(text ?? ''),
    );
  }
}

class KFilledButton extends HookConsumerWidget {
  const KFilledButton({
    super.key,
    this.text = '',
    this.backgroundColor,
    this.foregroundColor,
    required this.onPressed,
    this.loading,
    this.child,
    this.isSecondary = false,
    this.textStyle,
    this.size,
    this.padding,
  });

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final bool? loading;
  final Widget? child;
  final bool isSecondary;
  final TextStyle? textStyle;
  final Size? size;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      // style: ButtonStyle(
      //   minimumSize: MaterialStateProperty.all(size ?? Size.fromHeight(55.h)),
      //   textStyle: MaterialStateProperty.all(textStyle),
      //   backgroundColor: MaterialStateProperty.resolveWith<Color>(
      //       (Set<MaterialState> states) {
      //     if (states.contains(MaterialState.disabled)) {
      //       return context.theme.disabledColor;
      //     }
      //     return backgroundColor ??
      //         (isSecondary
      //             ? context.color.secondary
      //             : context.color.primary); // Use the component's default.
      //   }),
      //   foregroundColor:
      //       MaterialStateProperty.all(foregroundColor ?? Colors.white),
      //   overlayColor: MaterialStateProperty.all(
      //     isSecondary ? context.color.secondary : context.color.primary,
      //   ),
      // ),
      style: FilledButton.styleFrom(
        textStyle: textStyle,
        foregroundColor: foregroundColor ?? AppColors.white,
        backgroundColor: isSecondary ? AppColors.primary : backgroundColor,
        fixedSize: size ?? Size.fromHeight(35.h),
        minimumSize: size ?? Size.fromHeight(35.h),
        padding: padding,
        disabledForegroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.textHint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        elevation: 2,
      ),
      onPressed: (loading != null && loading!) ? null : onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 20.h,
              width: 20.h,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.text,
                ),
                strokeWidth: 2,
              ),
            )
          : child ?? (text.isEmpty ? const SizedBox.shrink() : Text(text)),
    );
  }
}

class KCircularButton extends StatelessWidget {
  const KCircularButton({
    super.key,
    this.radius = 20,
    this.onTap,
    this.icon,
    this.bgColor,
  });

  final double radius;

  final VoidCallback? onTap;
  final Widget? icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(200.w),
      color: Colors.transparent,
      child: KInkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(200.w),
        padding: EdgeInsets.all(4.w),
        child: Ink(
          color: Colors.transparent,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.transparent,
            child: icon,
          ),
        ),
      ),
    );
  }
}

class KTextButton extends StatelessWidget {
  const KTextButton({
    super.key,
    this.child,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.style,
    this.text = '',
  });

  final String text;
  final Widget? child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: TextButton(
        style: style ??
            TextButton.styleFrom(
              padding: padding ?? EdgeInsets.symmetric(horizontal: 6.w),
            ),
        onPressed: onPressed,
        child: child ??
            Text(
              text,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
      ),
    );
  }
}

class AppButton extends HookConsumerWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.disabledTextColor,
    this.loading,
    this.child,
    this.height,
    this.minWidth,
    this.borderRadius,
    this.side = BorderSide.none,
    this.shape,
    this.textTheme,
    this.focusNode,
    this.padding,
    this.elevation,
    this.disabledElevation,
    this.focusElevation,
    this.highlightElevation,
    this.hoverElevation,
    this.textStyle,
  });

  final String text;
  final Color? color, textColor, disabledTextColor;
  final VoidCallback? onPressed;
  final bool? loading;
  final Widget? child;
  final double? height, minWidth, elevation, focusElevation, hoverElevation, disabledElevation, highlightElevation;
  final ShapeBorder? shape;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide side;
  final ButtonTextTheme? textTheme;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      onPressed: onPressed,
      height: height,
      minWidth: minWidth,
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      disabledElevation: disabledElevation,
      highlightElevation: highlightElevation,
      color: color,
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      textTheme: textTheme,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? AppTheme.kButtonBorderRadius,
            side: side,
          ),
      focusNode: focusNode,
      padding: padding,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 24.h,
              width: 23.h,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(
                  textColor ?? Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          : child ?? Text(text, style: textStyle),
    );
  }

  factory AppButton.filled(
          {required void Function()? onPressed,
          String text = '',
          bool? loading,
          Widget? child,
          BorderRadius? borderRadius,
          double? width,
          double? height,
          EdgeInsetsGeometry? padding,
          TextStyle? textStyle}) =>
      AppButton(
        onPressed: onPressed,
        text: text,
        color: AppColors.primary,
        textColor: AppColors.white,
        disabledTextColor: AppColors.text200,
        loading: loading,
        minWidth: width,
        height: height,
        textStyle: textStyle ??
            TextStyle(
              fontFamily: 'Google Sans',
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
        borderRadius: borderRadius,
        disabledElevation: 4,
        elevation: 4,
        padding: padding ?? EdgeInsets.zero,
        child: child,
      );
  factory AppButton.filledSecondary({
    required void Function()? onPressed,
    String text = '',
    bool? loading,
  }) =>
      AppButton(
        onPressed: onPressed,
        text: text,
        color: AppColors.textParagraph,
        textColor: AppColors.textHint,
        loading: loading,
        textStyle: TextStyle(
          fontFamily: 'Google Sans',
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      );
}
