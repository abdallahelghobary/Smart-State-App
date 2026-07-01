import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Logo icon for Smart State: layered cyan squircles with database & lightning symbol.
class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key, this.size = 80});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * 1.3,
      height: size * 1.3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Back-most layer (tilted right)
          Transform.rotate(
            angle: 12 * 3.14159 / 180,
            child: Container(
              width: size * 0.90,
              height: size * 0.90,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(size * 0.22),
              ),
            ),
          ),
          // Middle layer (tilted left)
          Transform.rotate(
            angle: -6 * 3.14159 / 180,
            child: Container(
              width: size * 0.95,
              height: size * 0.95,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.22),
                borderRadius: BorderRadius.circular(size * 0.22),
              ),
            ),
          ),
          // Front-most main layer
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(size * 0.22),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.45),
                  blurRadius: size * 0.35,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CustomPaint(
              size: Size(size, size),
              painter: const _LogoIconPainter(
                foregroundColor: Colors.black87,
                cutoutColor: AppColors.accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoIconPainter extends CustomPainter {
  const _LogoIconPainter({
    required this.foregroundColor,
    required this.cutoutColor,
  });

  final Color foregroundColor;
  final Color cutoutColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;

    // Dimensions of the stacked database drives on the left
    final rectW = w * 0.30;
    final rectH = h * 0.12;
    final leftX = w * 0.22;
    final gap = h * 0.05;

    final topY = h * 0.35;
    final bottomY = topY + rectH + gap;

    final rx = rectH * 0.25; // Corner radius of server capsules

    // Draw top server capsule
    final topRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(leftX, topY, rectW, rectH),
      Radius.circular(rx),
    );
    canvas.drawRRect(topRect, paint);

    // Draw bottom server capsule
    final bottomRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(leftX, bottomY, rectW, rectH),
      Radius.circular(rx),
    );
    canvas.drawRRect(bottomRect, paint);

    // Draw cutout slots inside the database drives
    final cutoutPaint = Paint()
      ..color = cutoutColor
      ..style = PaintingStyle.fill;

    final cutoutW = rectW * 0.22;
    final cutoutH = rectH * 0.22;
    final cutoutLeft = leftX + rectW * 0.12;

    final topCutout = RRect.fromRectAndRadius(
      Rect.fromLTWH(cutoutLeft, topY + (rectH - cutoutH) / 2, cutoutW, cutoutH),
      Radius.circular(cutoutH * 0.5),
    );
    canvas.drawRRect(topCutout, cutoutPaint);

    final bottomCutout = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        cutoutLeft,
        bottomY + (rectH - cutoutH) / 2,
        cutoutW,
        cutoutH,
      ),
      Radius.circular(cutoutH * 0.5),
    );
    canvas.drawRRect(bottomCutout, cutoutPaint);

    // Draw the lightning bolt on the right side
    final boltPath = Path();
    boltPath.moveTo(w * 0.68, h * 0.28);
    boltPath.lineTo(w * 0.53, h * 0.53);
    boltPath.lineTo(w * 0.63, h * 0.53);
    boltPath.lineTo(w * 0.55, h * 0.74); // Bottom tip
    boltPath.lineTo(w * 0.76, h * 0.44);
    boltPath.lineTo(w * 0.66, h * 0.44);
    boltPath.close();

    canvas.drawPath(boltPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
