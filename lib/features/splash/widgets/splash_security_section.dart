import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Bottom section: secure connection and encrypted status.
class SplashSecuritySection extends StatelessWidget {
  const SplashSecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).height < 600;
    
    final labelStyle = TextStyle(
      fontSize: isCompact ? 9 : 10,
      fontWeight: FontWeight.w600,
      color: Colors.white.withValues(alpha: 0.35),
      letterSpacing: 1.5,
    );
    
    final statusStyle = TextStyle(
      fontSize: isCompact ? 10 : 12,
      fontWeight: FontWeight.w400,
      color: Colors.white.withValues(alpha: 0.5),
      letterSpacing: 0.5,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('SECURE CONNECTION ESTABLISHED', style: labelStyle),
        SizedBox(height: isCompact ? 6 : 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.gpp_good_outlined, // Shield with a checkmark
              size: isCompact ? 16 : 18,
              color: AppColors.accent,
            ),
            const SizedBox(width: 6),
            Text('Encrypted End-to-End', style: statusStyle),
          ],
        ),
      ],
    );
  }
}
