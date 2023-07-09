import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0xFF2697FF);
  Color get secondary => const Color(0xFF2F323E);
  Color get backgroud => const Color(0xFFE5E5E5);
  Color get scaffoldBackground => const Color(0xFFFFFFFF);
  Color get disabled => const Color(0xFFA8ABAD);
  // Color get disabled => const Color.fromARGB(255, 71, 51, 33);
  Color get secondaryButton => Colors.grey[500]!;
}

extension ColorAppExtensions on BuildContext {
  Color get primary => AppColors.i.primary;
  Color get secondary => AppColors.i.secondary;
  Color get backgroud => AppColors.i.backgroud;
  Color get scaffoldBackground => AppColors.i.scaffoldBackground;
  Color get disabled => AppColors.i.disabled;
  Color get secondaryButton => AppColors.i.secondaryButton;
}
