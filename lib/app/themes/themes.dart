import 'package:flutter/material.dart';
import 'package:photo_separator/app/themes/styles/app_colors.dart';
import 'package:photo_separator/app/themes/styles/app_styles.dart';
import 'package:photo_separator/app/themes/styles/app_text_styles.dart';

class Themes {
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.i.primary,
      primary: AppColors.i.primary,
      secondary: AppColors.i.secondary,
    ),
    scaffoldBackgroundColor: AppColors.i.scaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.i.scaffoldBackground,
      titleSpacing: 0.0,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.i.primary),
      titleTextStyle: TextStyle(color: AppColors.i.secondary),
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.i.primaryButton),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[50],
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(20),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: AppTextStyles.i.textMedium.copyWith(
        color: Colors.black,
      ),
      errorStyle: AppTextStyles.i.textMedium.copyWith(
        color: Colors.redAccent,
      ),
    ),
  );
}
