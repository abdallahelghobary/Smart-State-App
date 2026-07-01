import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Pagination dots: active pill, inactive circles.
class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({
    super.key,
    required this.currentIndex,
    this.pageCount = 3,
  });

  final int currentIndex;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    const dotSize = 10.0;
    const activeWidth = 24.0;
    const gap = 12.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pageCount, (index) {
          final isActive = index == currentIndex;
          return Padding(
            padding: EdgeInsets.only(right: index < pageCount - 1 ? gap : 0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isActive ? activeWidth : dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.onboardingAccent
                    : AppColors.dotInactive,
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
          );
        }),
      ),
    );
  }
}
