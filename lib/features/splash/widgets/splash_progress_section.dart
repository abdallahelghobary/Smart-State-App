import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Middle section: status text, progress bar, and percentage.
class SplashProgressSection extends StatelessWidget {
  const SplashProgressSection({
    super.key,
    this.statusText = 'System initializing...',
    this.progress = 0.32,
  });

  final String statusText;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isCompact = size.height < 600;
    final barWidth = size.width * 0.7;
    final statusStyle = TextStyle(
      fontSize: isCompact ? 12 : 14,
      color: AppColors.textSecondary,
    );
    final percentStyle = TextStyle(
      fontSize: isCompact ? 12 : 14,
      fontWeight: FontWeight.w600,
      color: AppColors.accent,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(statusText, style: statusStyle),
        SizedBox(height: isCompact ? 8 : 12),
        SizedBox(
          width: barWidth,
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    backgroundColor: AppColors.progressTrack,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${(progress * 100).round()}%',
                style: percentStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
