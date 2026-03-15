import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';
import 'package:smart_state_app/features/splash/widgets/splash_logo.dart';

/// Top section of the splash screen: logo, title, and subtitle.
class SplashBrandingSection extends StatelessWidget {
  const SplashBrandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isCompact = size.height < 600 || size.width < 360;
    final logoSize = isCompact ? 56.0 : 80.0;
    final titleStyle = TextStyle(
      fontSize: isCompact ? 24 : 32,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    );
    final subtitleStyle = TextStyle(
      fontSize: isCompact ? 10 : 12,
      fontWeight: FontWeight.w500,
      color: AppColors.accent,
      letterSpacing: 1.2,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SplashLogo(size: logoSize),
        SizedBox(height: isCompact ? 12 : 20),
        Text('Smart State', style: titleStyle),
        SizedBox(height: isCompact ? 4 : 8),
        Text('INTELLIGENT GOVERNANCE', style: subtitleStyle),
      ],
    );
  }
}
