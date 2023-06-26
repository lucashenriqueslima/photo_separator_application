import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0xFFB65819);
  Color get secondary => const Color(0xFFF2F2F5);
  Color get third => const Color(0xFF1F1E1E);
  Color get backgroud => const Color(0xFFEBA679);
  Color get scaffoldBackground => const Color(0xFFEBE1DA);
  // Color get disabled => const Color.fromARGB(255, 71, 51, 33);
  Color get secondaryButton => Colors.grey[500]!;
}

extension ColorAppExtensions on BuildContext {
  Color get primary => AppColors.i.primary;
  Color get secondary => AppColors.i.secondary;
  Color get third => AppColors.i.third;
  Color get backgroud => AppColors.i.backgroud;
  Color get scaffoldBackground => AppColors.i.scaffoldBackground;
  Color get secondaryButton => AppColors.i.secondaryButton;
}
