import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// App-wide theme configuration for Smart State.
abstract final class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          surface: AppColors.backgroundWhite,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.backgroundWhite,
      );
}
