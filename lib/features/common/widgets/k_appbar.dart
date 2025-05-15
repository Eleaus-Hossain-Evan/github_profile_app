import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/core.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    super.key,
    this.leading,
    this.title,
    this.titleText,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.titleTextStyle,
    this.centerTitle = true,
    this.showBack = true,
    this.bottom,
    this.backgroundColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.elevation,
    this.foregroundColor,
    this.systemOverlayStyle,
    this.iconTheme,
    this.actionsIconTheme,
    this.scrolledUnderElevation,
    this.forceMaterialTransparency = false,
    this.leadingWidth,
  });

  final Widget? leading;
  final Widget? title;
  final String? titleText;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final TextStyle? titleTextStyle;
  final bool centerTitle;
  final bool showBack;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor, foregroundColor, surfaceTintColor, shadowColor;
  final double? elevation;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final double? scrolledUnderElevation, leadingWidth;
  final bool forceMaterialTransparency;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? Colors.transparent,
      surfaceTintColor: surfaceTintColor,
      foregroundColor: foregroundColor,
      leading: leading,
      leadingWidth: leadingWidth,
      titleTextStyle: titleTextStyle,
      title: title ?? Text(titleText ?? ''),
      actions: actions,
      bottom: bottom,
      elevation: elevation,
      shadowColor: shadowColor,
      systemOverlayStyle: systemOverlayStyle,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      scrolledUnderElevation: scrolledUnderElevation,
      forceMaterialTransparency: forceMaterialTransparency,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(bottom == null ? kToolbarHeight : kToolbarHeight + kToolbarHeight + 16);

  factory KAppBar.primary({
    Widget? leading,
    Widget? title,
    String? titleText,
    List<Widget>? actions,
    bool automaticallyImplyLeading = true,
    TextStyle? titleTextStyle,
    bool centerTitle = true,
    PreferredSizeWidget? bottom,
    double? elevation,
  }) =>
      KAppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.white),
        actionsIconTheme: const IconThemeData(color: AppColors.white),
        leading: const BackButton(),
        title: title,
        titleText: titleText,
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
        titleTextStyle: titleTextStyle,
        centerTitle: centerTitle,
        bottom: bottom,
        elevation: elevation,
      );

  factory KAppBar.transparent({
    Widget? leading,
    Widget? title,
    String? titleText,
    List<Widget>? actions,
    bool automaticallyImplyLeading = true,
    TextStyle? titleTextStyle,
    bool centerTitle = true,
    PreferredSizeWidget? bottom,
    double elevation = 0,
    Color surfaceTintColor = AppColors.transparent,
    Color shadowColor = AppColors.transparent,
    bool forceMaterialTransparency = true,
  }) =>
      KAppBar(
        backgroundColor: AppColors.transparent,
        surfaceTintColor: surfaceTintColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        leading: leading,
        title: title,
        titleText: titleText,
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
        titleTextStyle: titleTextStyle,
        centerTitle: centerTitle,
        bottom: bottom,
        elevation: elevation,
        shadowColor: shadowColor,
        forceMaterialTransparency: forceMaterialTransparency,
      );
}
