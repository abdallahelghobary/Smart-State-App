import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Bottom section: secure connection and encrypted status.
class SplashSecuritySection extends StatelessWidget {
  const SplashSecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).height < 600;
    final textStyle = TextStyle(
      fontSize: isCompact ? 10 : 11,
      color: AppColors.textTertiary,
      letterSpacing: 0.8,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('SECURE CONNECTION ESTABLISHED', style: textStyle),
        SizedBox(height: isCompact ? 6 : 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shield_outlined,
              size: isCompact ? 18 : 22,
              color: AppColors.accent,
            ),
            const SizedBox(width: 8),
            Text('Encrypted End-to-End', style: textStyle),
          ],
        ),
      ],
    );
  }
}
