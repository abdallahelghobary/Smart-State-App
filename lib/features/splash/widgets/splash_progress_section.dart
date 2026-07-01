import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Middle section: status text, progress percentage, and horizontal loading bar.
class SplashProgressSection extends StatelessWidget {
  const SplashProgressSection({
    super.key,
    this.statusText = 'System initializing...',
    this.progress = 0.32,
    this.isLoading = false,
  });

  final String statusText;
  final double progress;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isCompact = size.height < 600;
    
    final statusStyle = TextStyle(
      fontSize: isCompact ? 12 : 14,
      fontWeight: FontWeight.w400,
      color: Colors.white.withValues(alpha: 0.65),
      letterSpacing: 0.2,
    );
    final percentStyle = TextStyle(
      fontSize: isCompact ? 12 : 14,
      fontWeight: FontWeight.bold,
      color: AppColors.accent,
    );

    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(statusText, style: statusStyle),
              Text('${(progress * 100).round()}%', style: percentStyle),
            ],
          ),
          SizedBox(height: isCompact ? 8 : 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                value: progress.clamp(0.0, 1.0),
                backgroundColor: Colors.white.withValues(alpha: 0.08),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.accent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
