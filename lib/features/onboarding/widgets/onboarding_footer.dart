import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';
import 'package:smart_state_app/features/onboarding/widgets/onboarding_step_card.dart';

/// Footer: primary Next button and step preview cards.
class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    super.key,
    required this.onNext,
    this.nextLabel = 'Next',
    this.showStepCards = true,
  });

  final VoidCallback onNext;
  final String nextLabel;
  final bool showStepCards;

  @override
  Widget build(BuildContext context) {
    final horizontal = (MediaQuery.sizeOf(context).width * 0.06).clamp(
      24.0,
      24.0,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal, 0, horizontal, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onNext,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.onboardingAccent,
                foregroundColor: AppColors.textPrimary,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 28 / 18,
                ),
              ),
              child: Text(nextLabel),
            ),
          ),
          if (showStepCards) ...[
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: OnboardingStepCard(
                    stepLabel: 'Step 2',
                    title: 'Contact Owners',
                    icon: Icons.chat_bubble_outline,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: OnboardingStepCard(
                    stepLabel: 'Step 3',
                    title: 'Split Bills',
                    icon: Icons.receipt_long_outlined,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
