import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Title and description below the hero image.
class OnboardingContentSection extends StatelessWidget {
  const OnboardingContentSection({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isCompact = size.height < 600;
    final titleSize = isCompact ? 24.0 : 28.0;
    final bodySize = isCompact ? 14.0 : 16.0;
    final horizontal = (size.width * 0.06).clamp(20.0, 32.0);

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal, 16, horizontal, 16),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              color: AppColors.textOnboardingPrimary,
              letterSpacing: -0.5,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width * 0.9),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: bodySize,
                fontWeight: FontWeight.normal,
                color: AppColors.textOnboardingSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
