import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        fontFamily: 'Google Sans',
        filledButtonTheme: _filledButtonTheme,
        textButtonTheme: _textButtonThemeData,
        buttonTheme: _buttonThemeData,
        appBarTheme: _appBarThemeData,
        cardTheme: _cardThemeData,
        tabBarTheme: _tabBarThemeData,
        bottomSheetTheme: _bottomSheetThemeData,
        inputDecorationTheme: _inputDecorationTheme,
        navigationBarTheme: _navigationBarTheme,
        badgeTheme: BadgeThemeData(
          backgroundColor: AppColors.primary.darken(20),
          textStyle: TextStyle(
            color: AppColors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        // filled: true,
        // fillColor: AppColors.white,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        labelStyle: TextStyle(
          color: AppColors.black.withOpacity(.38),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          color: AppColors.black.withOpacity(.38),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelStyle: TextStyle(
          fontWeight: FontWeight.w700,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.error,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      );

  static AppBarTheme get _appBarThemeData => const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 4,
      );

  static FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          maximumSize: Size.fromHeight(50.h),
          fixedSize: Size.fromHeight(50.h),
          minimumSize: Size.fromHeight(50.h),
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: kButtonBorderRadius),
          textStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
  static ButtonThemeData get _buttonThemeData => ButtonThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        buttonColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: kButtonBorderRadius),
        minWidth: double.infinity,
        height: 50.h,
        textTheme: ButtonTextTheme.accent,
      );

  static TextButtonThemeData get _textButtonThemeData => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(borderRadius: kButtonBorderRadius),
        ),
      );

  static CardTheme get _cardThemeData => CardTheme(
        elevation: 2,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      );

  static TabBarTheme get _tabBarThemeData => TabBarTheme(
        labelColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: AppColors.textSubtitle.lighten(15),
      );

  static BottomSheetThemeData get _bottomSheetThemeData => BottomSheetThemeData(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        showDragHandle: true,
      );

  static NavigationBarThemeData get _navigationBarTheme => NavigationBarThemeData(
        elevation: 4,
        iconTheme: WidgetStateProperty.fromMap(
          {
            WidgetState.selected: IconThemeData(color: AppColors.primary),
            WidgetState.any: IconThemeData(color: AppColors.textSubtitle),
          },
        ),
        labelTextStyle: WidgetStateProperty.fromMap(
          {
            WidgetState.selected: TextStyle(
              color: AppColors.primary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
            WidgetState.any: TextStyle(
              color: AppColors.textSubtitle,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          },
        ),
      );

  static final kButtonBorderRadius = BorderRadius.circular(12);
}
