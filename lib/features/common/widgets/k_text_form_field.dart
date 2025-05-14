import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';

class KTextFormField extends HookConsumerWidget {
  const KTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.suffix,
    this.readOnly = false,
    this.enabled = true,
    this.onTap,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    this.maxLines,
    this.contentPadding,
    this.fillColor = Colors.transparent,
    this.borderColor = AppColors.primary,
    this.initialBorderColor = AppColors.border,
    this.hintTextStyle,
    this.autofocus = false,
    this.focusBorderWidth = 2,
    this.inputFormatters,
    this.suffixText,
  });

  final TextEditingController? controller;
  final String? hintText, labelText;
  final TextAlign textAlign;
  final Widget? suffixIcon, suffix;
  final bool readOnly, enabled;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool isObscure;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String)? onChanged, onFieldSubmitted;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final Color? fillColor, borderColor, initialBorderColor;
  final TextStyle? hintTextStyle;
  final bool autofocus;
  final double focusBorderWidth;
  final List<TextInputFormatter>? inputFormatters;
  final String? suffixText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideText = useState(true);
    final haveText = useState<bool>(false);

    final border = UnderlineInputBorder(
      borderSide: BorderSide(
        color: initialBorderColor!,
        width: 1,
      ),
    );

    final focusBorder = border.copyWith(
      borderSide: BorderSide(
        color: borderColor!,
        width: focusBorderWidth,
      ),
    );

    final levelStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: AppColors.black,
      height: 1.5,
    );

    return TextFormField(
      obscureText: isObscure ? hideText.value : false,
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUnfocus,
      style: levelStyle.copyWith(
        color: AppColors.black,
        letterSpacing: 1.5,
      ),
      textAlign: textAlign,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      // expands: true,
      decoration: InputDecoration(
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 8.w, horizontal: 0.w),
        hintText: hintText,
        hintStyle: hintTextStyle,
        labelText: labelText,
        labelStyle: levelStyle,
        floatingLabelStyle: levelStyle,
        alignLabelWithHint: true,
        // contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 12.h),
        border: border,
        enabledBorder: haveText.value ? focusBorder : border,
        focusedBorder: focusBorder,
        disabledBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(
            color: context.color.error,
          ),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(
            color: context.color.error,
            width: focusBorderWidth,
          ),
        ),
        fillColor: fillColor,
        filled: false,
        isDense: false,
        focusColor: AppColors.primary,
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        suffixIcon: suffixIcon ??
            (isObscure
                ? IconButton(
                    // borderRadius: BorderRadius.circular(24.r),
                    onPressed: () {
                      hideText.value = !hideText.value;
                    },
                    icon: hideText.value
                        ? const Icon(Icons.lock_rounded)
                        : const Icon(Icons.lock_open_rounded),
                  )
                : null),
        suffix: suffix,
        suffixIconColor: AppColors.textSubtitle.withOpacity(.6),
      ),
      onTap: onTap,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: (value) {
        onChanged?.call(value);
        haveText.value = value.isNotEmpty;
      },
      onTapOutside: (details) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }

  factory KTextFormField.date({
    Key? key,
    String datePattern = 'MMMM dd, yyyy',
    TextEditingController? controller,
    String? hintText,
    String? labelText,
    TextAlign textAlign = TextAlign.start,
    Widget? suffixIcon,
    bool readOnly = false,
    bool enabled = true,
    void Function()? onTap,
    Widget? prefixIcon,
    String? Function(String?)? validator,
    FocusNode? focusNode,
    bool isObscure = false,
    TextInputType keyboardType = TextInputType.text,
    dynamic Function(String)? onChanged,
    dynamic Function(String)? onFieldSubmitted,
    TextInputAction textInputAction = TextInputAction.next,
    int? maxLines = 1,
    EdgeInsets? contentPadding = const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
    Color fillColor = Colors.transparent,
    Color borderColor = AppColors.primary,
    Color? initialBorderColor,
    TextStyle? hintTextStyle,
    bool autofocus = false,
    double borderWidth = 1,
  }) =>
      KTextFormField(
        key: key,
        controller: controller,
        keyboardType: TextInputType.datetime,
        hintText: hintText,
        labelText: labelText,
        validator: validator,
        readOnly: true,
        enabled: enabled,
        onTap: () {
          showDatePicker(
            context: AppGlobalKeys.mainNavigatorKey.currentContext!,
            firstDate: DateTime(1950, 1, 1),
            lastDate: DateTime.now(),
          ).then((date) {
            controller?.text = date == null ? '' : DateFormat(datePattern).format(date);
            onChanged?.call(controller?.text ?? '');
          });
        },
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ??
            Icon(
              Icons.calendar_month,
              color: Colors.blueGrey.withOpacity(.6),
            ),
        focusNode: focusNode,
        isObscure: isObscure,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        maxLines: maxLines,
        contentPadding: contentPadding,
        fillColor: fillColor,
        borderColor: borderColor,
        autofocus: autofocus,
        focusBorderWidth: borderWidth,
        hintTextStyle: hintTextStyle,
        initialBorderColor: initialBorderColor,
        textAlign: textAlign,
      );
}

class KTextFormField2 extends HookConsumerWidget {
  const KTextFormField2({
    super.key,
    this.controller,
    this.hintText,
    this.hintTextStyle,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.suffix,
    this.readOnly = false,
    this.enabled = true,
    this.isDense,
    this.filled,
    this.onTap,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.maxLines,
    this.contentPadding,
    this.fillColor,
    this.borderColor,
    this.initialBorderColor,
    this.autofocus = false,
    this.focusBorderWidth = 2,
    this.inputFormatters,
    this.suffixText,
    this.textStyle,
    this.borderRadius,
  });

  final TextEditingController? controller;
  final String? hintText, labelText;
  final TextAlign textAlign;
  final Widget? suffixIcon, suffix;
  final bool readOnly, autofocus, isObscure;
  final bool? enabled, filled, isDense;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged, onFieldSubmitted;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final Color? fillColor, borderColor, initialBorderColor;
  final TextStyle? hintTextStyle, labelStyle, floatingLabelStyle;
  final double focusBorderWidth;
  final List<TextInputFormatter>? inputFormatters;
  final String? suffixText;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideText = useState(true);
    final haveText = useState<bool>(false);

    final border = OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: initialBorderColor ?? AppColors.border,
        width: 1,
      ),
    );

    final focusBorder = border.copyWith(
      borderSide: BorderSide(
        color: borderColor ?? AppColors.primary,
        width: focusBorderWidth,
      ),
    );

    final disabledBorder = border.copyWith(
      borderSide: BorderSide(
        color: AppColors.border.withOpacity(.2),
        width: 1.5,
      ),
    );

    return TextFormField(
      obscureText: isObscure ? hideText.value : false,
      // obscuringCharacter: '*',
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      enabled: enabled,
      autofocus: autofocus,
      autovalidateMode: AutovalidateMode.onUnfocus,
      style: textStyle,
      textAlign: textAlign,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      // expands: true,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 14.w),
        hintText: hintText,
        hintStyle: hintTextStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        floatingLabelStyle: floatingLabelStyle,
        alignLabelWithHint: true,
        // contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 12.h),
        border: border,
        enabledBorder: haveText.value ? focusBorder : border,
        focusedBorder: focusBorder,
        disabledBorder: disabledBorder,
        fillColor: fillColor,
        filled: filled,
        isDense: isDense,
        focusColor: AppColors.primary,
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        suffixIcon: suffixIcon ??
            (isObscure
                ? IconButton(
                    // borderRadius: BorderRadius.circular(24.r),
                    onPressed: () {
                      hideText.value = !hideText.value;
                    },
                    icon: hideText.value
                        ? const Icon(Icons.lock_rounded)
                        : const Icon(Icons.lock_open_rounded),
                  )
                : null),
        suffix: suffix,
      ),
      onTap: onTap,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: (value) {
        onChanged?.call(value);
        haveText.value = value.isNotEmpty;
      },
      onTapOutside: (details) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }

  factory KTextFormField2.date({
    Key? key,
    String datePattern = 'MMMM dd, yyyy',
    TextEditingController? controller,
    String? hintText,
    String? labelText,
    TextAlign textAlign = TextAlign.start,
    Widget? suffixIcon,
    bool readOnly = false,
    bool enabled = true,
    void Function()? onTap,
    Widget? prefixIcon,
    String? Function(String?)? validator,
    FocusNode? focusNode,
    bool isObscure = false,
    TextInputType keyboardType = TextInputType.text,
    dynamic Function(String)? onChanged,
    dynamic Function(String)? onFieldSubmitted,
    TextInputAction? textInputAction,
    int? maxLines = 1,
    EdgeInsets? contentPadding = const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
    Color fillColor = Colors.transparent,
    Color borderColor = AppColors.primary,
    Color? initialBorderColor,
    TextStyle? hintTextStyle,
    bool autofocus = false,
    double borderWidth = 1,
  }) =>
      KTextFormField2(
        key: key,
        controller: controller,
        keyboardType: TextInputType.datetime,
        hintText: hintText,
        labelText: labelText,
        validator: validator,
        readOnly: true,
        enabled: enabled,
        onTap: () {
          showDatePicker(
            context: AppGlobalKeys.mainNavigatorKey.currentContext!,
            firstDate: DateTime(1950, 1, 1),
            lastDate: DateTime.now(),
            currentDate: DateTime.now(),
            initialDate:
                controller!.text.isEmpty ? null : DateFormat(datePattern).parse(controller.text),
          ).then((date) {
            controller.text = date == null ? '' : DateFormat(datePattern).format(date);
            onChanged?.call(date == null ? '' : DateFormat(datePattern).format(date));
          });
        },
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ??
            Icon(
              Icons.calendar_month,
              color: Colors.blueGrey.withOpacity(.6),
            ),
        focusNode: focusNode,
        isObscure: isObscure,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        maxLines: maxLines,
        contentPadding: contentPadding,
        fillColor: fillColor,
        borderColor: borderColor,
        autofocus: autofocus,
        focusBorderWidth: borderWidth,
        hintTextStyle: hintTextStyle,
        initialBorderColor: initialBorderColor,
        textAlign: textAlign,
      );
}
