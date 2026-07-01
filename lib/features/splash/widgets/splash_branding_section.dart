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
    final logoSize = isCompact ? 64.0 : 80.0;
    
    final titleStyle = TextStyle(
      fontSize: isCompact ? 26 : 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 0.5,
    );
    final subtitleStyle = TextStyle(
      fontSize: isCompact ? 10 : 12,
      fontWeight: FontWeight.w700,
      color: AppColors.accent,
      letterSpacing: 2.0,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SplashLogo(size: logoSize),
        SizedBox(height: isCompact ? 16 : 24),
        Text('Smart State', style: titleStyle),
        SizedBox(height: isCompact ? 6 : 10),
        Text('INTELLIGENT GOVERNANCE', style: subtitleStyle),
      ],
    );
  }
}
