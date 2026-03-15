import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';
import 'package:smart_state_app/features/splash/widgets/splash_branding_section.dart';
import 'package:smart_state_app/features/splash/widgets/splash_progress_section.dart';
import 'package:smart_state_app/features/splash/widgets/splash_security_section.dart';

/// Splash screen with branding, initialization progress, and security status.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const double _progress = 0.32;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.backgroundDark,
              AppColors.backgroundLight,
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final padding = _responsivePadding(constraints);
              return Padding(
                padding: padding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    const SplashBrandingSection(),
                    SplashProgressSection(progress: _progress),
                    const SplashSecuritySection(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  EdgeInsets _responsivePadding(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final horizontal = width * 0.08;
    final vertical = height * 0.04;
    return EdgeInsets.symmetric(
      horizontal: horizontal.clamp(16.0, 48.0),
      vertical: vertical.clamp(12.0, 32.0),
    );
  }
}
