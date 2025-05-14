import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../core/utils/constants/api_endpoints.dart';

class KCachedNetworkImageNoBase extends StatelessWidget {
  const KCachedNetworkImageNoBase({
    super.key,
    required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.zero),
    this.height = 200,
    this.width = double.infinity,
    this.borderWidth,
    this.fit = BoxFit.cover,
    this.child,
    this.padding,
    this.margin,
    this.borderColor,
    this.backgroundColor,
    this.colorBlendMode,
  });

  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final double? height, width, borderWidth;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final Color? borderColor, backgroundColor;
  final BlendMode? colorBlendMode;

  @override
  Widget build(BuildContext context) {
    log(imageUrl);
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      colorBlendMode: colorBlendMode,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1.w,
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        );
      },
      height: height,
      width: width,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: SizedBox(
          height: 30.h,
          width: 30.h,
          child: CircularProgressIndicator(
            value: progress.progress,
            strokeWidth: .8.w,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      // placeholder: (context, url) => const Icon(Icons.error),
    );
  }
}

class KCachedNetworkImageWdLoading extends StatelessWidget {
  const KCachedNetworkImageWdLoading({
    super.key,
    required this.imageUrl,
    this.borderRadius,
    this.height = 200,
    this.width = double.infinity,
    this.borderWidth,
    this.fit = BoxFit.cover,
    this.child,
    this.padding,
    this.margin,
    this.borderColor,
    this.color,
    this.colorBlendMode,
    this.isBox = true,
    this.isHero = false,
    this.shape = BoxShape.rectangle,
  });

  final String imageUrl;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final double? height, width, borderWidth;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final Color? borderColor;
  final Color? color;
  final BlendMode? colorBlendMode;
  final bool isBox, isHero;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    var isContainer =
        (borderWidth != null && borderColor != null && borderRadius != const BorderRadius.all(Radius.zero));
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      imageBuilder: isContainer || isBox
          ? (context, imageProvider) {
              return Hero(
                tag: isHero ? ValueKey(imageUrl) : UniqueKey(),
                child: Container(
                  width: width ?? double.infinity,
                  height: height ?? double.infinity,
                  padding: padding,
                  margin: margin,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    border: Border.all(
                      color: borderColor ?? Colors.transparent,
                      width: borderWidth ?? 1.w,
                    ),
                    shape: shape,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: child,
                ),
              );
            }
          : null,
      height: height,
      width: width,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: SizedBox(
          height: 30.h,
          width: 30.h,
          child: CircularProgressIndicator(
            value: progress.progress,
            strokeWidth: .8.w,
          ),
        ),
      ),
      errorWidget: (context, url, error) {
        if (url.isEmpty) {
          return const Icon(Icons.error);
        }

        return const Icon(
          Icons.attach_file_rounded,
          color: AppColors.primary,
          size: 32,
        );
      },
      // placeholder: (context, url) => const Icon(Icons.error),
    );
  }
}

class KCachedNetworkImage extends StatelessWidget {
  const KCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = 200,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;

  final BoxFit? fit;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty
        ? const SizedBox.expand()
        : CachedNetworkImage(
            imageUrl: "${ApiEndpoint.baseUrl}$imageUrl",
            fit: fit,
            height: height,
            width: width,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            // placeholder: (context, url) => const Icon(Icons.error),
          );
  }
}
