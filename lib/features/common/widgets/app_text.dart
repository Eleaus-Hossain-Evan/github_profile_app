import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.fontSize,
    this.fontWeight,
    this.color = AppColors.text,
    this.height = 1,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.letterSpacing,
    this.fontStyle,
  });

  final String text;
  final TextStyle? style;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final bool? softWrap;
  final double? letterSpacing;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
          ),
    );
  }

  const AppText.primary(
    String text, {
    Key? key,
    TextStyle? style,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) : this(
          key: key,
          text,
          style: style ?? style,
          fontSize: fontSize ?? fontSize,
          fontWeight: fontWeight ?? fontWeight,
          color: AppColors.primary,
          height: height ?? height,
          maxLines: maxLines ?? maxLines,
          textAlign: textAlign ?? textAlign,
          overflow: overflow ?? overflow,
          softWrap: softWrap ?? softWrap,
          letterSpacing: letterSpacing ?? letterSpacing,
          fontStyle: fontStyle ?? fontStyle,
        );

  const AppText.white(
    String text, {
    Key? key,
    TextStyle? style,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) : this(
          key: key,
          text,
          style: style ?? style,
          fontSize: fontSize ?? fontSize,
          fontWeight: fontWeight ?? fontWeight,
          color: AppColors.white,
          height: height ?? height,
          maxLines: maxLines ?? maxLines,
          textAlign: textAlign ?? textAlign,
          overflow: overflow ?? overflow,
          softWrap: softWrap ?? softWrap,
          letterSpacing: letterSpacing ?? letterSpacing,
          fontStyle: fontStyle ?? fontStyle,
        );
  const AppText.gray(
    String text, {
    Key? key,
    TextStyle? style,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? overflow,
    bool? softWrap,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) : this(
          key: key,
          text,
          style: style ?? style,
          fontSize: fontSize ?? fontSize,
          fontWeight: fontWeight ?? fontWeight,
          color: AppColors.textSubtitle,
          height: height ?? height,
          maxLines: maxLines ?? maxLines,
          textAlign: textAlign ?? textAlign,
          overflow: overflow ?? overflow,
          softWrap: softWrap ?? softWrap,
          letterSpacing: letterSpacing ?? letterSpacing,
          fontStyle: fontStyle ?? fontStyle,
        );
}
