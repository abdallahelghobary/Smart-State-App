import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Logo icon for Smart State: turquoise rounded square with data/power symbol.
class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key, this.size = 80});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(size * 0.15),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.4),
            blurRadius: size * 0.25,
            spreadRadius: 0,
          ),
        ],
      ),
      child: CustomPaint(
        size: Size(size, size),
        painter: _LogoIconPainter(),
      ),
    );
  }
}

class _LogoIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.logoForeground
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;
    final pad = w * 0.22;

    // Two stacked rectangles (left)
    final rectW = w * 0.18;
    final rectH = h * 0.12;
    final gap = h * 0.06;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(pad, h * 0.32 - rectH * 0.5, rectW, rectH),
        const Radius.circular(2),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(pad, h * 0.32 + gap - rectH * 0.5, rectW, rectH),
        const Radius.circular(2),
      ),
      paint,
    );

    // Lightning bolt (right)
    final path = Path()
      ..moveTo(w - pad - w * 0.12, h * 0.28)
      ..lineTo(w - pad - w * 0.22, h * 0.5)
      ..lineTo(w - pad - w * 0.14, h * 0.5)
      ..lineTo(w - pad - w * 0.2, h * 0.72)
      ..lineTo(w - pad - w * 0.06, h * 0.38)
      ..lineTo(w - pad - w * 0.14, h * 0.38)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
