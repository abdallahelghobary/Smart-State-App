import 'package:flutter/material.dart';

/// Centralized app color palette for Smart State.
abstract final class AppColors {
  AppColors._();

  // Primary (splash & branding)
  static const Color primary = Color(0xFF1A3638);

  // Background
  static const Color backgroundWhite = Color(0xFF25454A);
  static const Color backgroundDark = Color(0xFF1A3638);
  static const Color backgroundLight = Color(0xFF205052);

  // Accent (vibrant turquoise)
  static const Color accent = Color(0xFF2EE8D1);

  // Text
  static const Color textPrimary = Color(0xFF25454A);
  static const Color textSecondary = Color(0xFFFFFFFF);
  static const Color textTertiary = Color(0xFFA0C0C0);

  // Logo / UI elements
  static const Color logoForeground = Color(0xFF202020);
  static const Color progressTrack = Color(0xFF508080);

  // Onboarding (Figma Smart State 1, node 3311-82)
  static const Color onboardingAccent = Color(0xFF17C4C4);
  static const Color backgroundOnboarding = Color(0xFF0B1718);
  static const Color heroCardBackground = Color(0xFF1B4245);
  static const Color textOnboardingPrimary = Color(0xFFFFFFFF);
  static const Color textOnboardingSecondary = Color(0xFF94A3B8);
  static const Color dotInactive = Color(0xFF334155);
  static const Color cardBorder = Color(0xFF25454A);
  static const Color cardBackground = Color(0xFF152A2D);

  // Login screen
  static const Color loginBackground = Color(0xFF0D1F22);
  static const Color inputBackground = Color(0xFF152A2D);
  static const Color inputBorder = Color(0xFF243E42);
  static const Color inputBorderFocused = Color(0xFF2EE8D1);
  static const Color dividerColor = Color(0xFF1E3438);
  static const Color socialButtonBorder = Color(0xFF1E3438);
  static const Color forgotPasswordColor = Color(0xFF2EE8D1);
  static const Color createAccountColor = Color(0xFF2EE8D1);
}
