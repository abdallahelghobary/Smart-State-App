import 'package:flutter/material.dart';

/// Centralized app color palette for Smart State.
abstract final class AppColors {
  AppColors._();

  // Primary (splash & branding)
  static const Color primary = Color(0xFFF24405);

  // Background
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF1A3638);
  static const Color backgroundLight = Color(0xFF205052);

  // Accent (vibrant turquoise)
  static const Color accent = Color(0xFF2EE8D1);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFF0F0F0);
  static const Color textTertiary = Color(0xFFA0C0C0);

  // Logo / UI elements
  static const Color logoForeground = Color(0xFF202020);
  static const Color progressTrack = Color(0xFF508080);

  // Onboarding
  static const Color backgroundOnboarding = Color(0xFF112121);
  static const Color textOnboardingPrimary = Color(0xFFF1F5F9);
  static const Color textOnboardingSecondary = Color(0xFF94A3B8);
  static const Color dotInactive = Color(0xFF334155);
  static const Color cardBorder = Color(0xFF334155);
  static const Color cardBackground = Color(0x801E293B); // 50% opacity
}
