import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Compact logo used at the top of the login screen.
class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key, this.size = 56});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(size * 0.22),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.35),
            blurRadius: size * 0.4,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CustomPaint(
        size: Size(size, size),
        painter: const _GridIconPainter(),
      ),
    );
  }
}

class _GridIconPainter extends CustomPainter {
  const _GridIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0D1F22)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06
      ..strokeCap = StrokeCap.round;

    final w = size.width;
    final h = size.height;
    final pad = w * 0.22;
    final innerW = w - pad * 2;
    final innerH = h - pad * 2;

    // Draw a 3×3 grid
    final cellW = innerW / 3;
    final cellH = innerH / 3;

    // Vertical lines (2 inner)
    for (int i = 1; i <= 2; i++) {
      final x = pad + cellW * i;
      canvas.drawLine(Offset(x, pad), Offset(x, pad + innerH), paint);
    }
    // Horizontal lines (2 inner)
    for (int j = 1; j <= 2; j++) {
      final y = pad + cellH * j;
      canvas.drawLine(Offset(pad, y), Offset(pad + innerW, y), paint);
    }

    // Outer border rounded rect
    final borderPaint = Paint()
      ..color = const Color(0xFF0D1F22)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.07
      ..strokeJoin = StrokeJoin.round;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(pad, pad, innerW, innerH),
        Radius.circular(size.width * 0.06),
      ),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
