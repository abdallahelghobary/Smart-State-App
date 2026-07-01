import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';
import 'package:smart_state_app/features/splash/widgets/splash_logo.dart';

/// Top bar: logo, app name, and optional Skip action.
class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key, this.onSkip});

  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    final horizontal = (MediaQuery.sizeOf(context).width * 0.04).clamp(
      16.0,
      16.0,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal, 16, horizontal, 8),
      child: Row(
        children: [
          const SplashLogo(size: 27),
          const SizedBox(width: 8),
          const Text(
            'Smart State',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textOnboardingPrimary,
              letterSpacing: -0.27,
              height: 22.5 / 18,
            ),
          ),
          const Spacer(),
          if (onSkip != null)
            TextButton(
              onPressed: onSkip,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.onboardingAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.24,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
