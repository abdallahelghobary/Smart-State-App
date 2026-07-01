import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// "OR CONTINUE WITH" divider with Google and Apple buttons.
class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({
    super.key,
    this.onGoogleTap,
    this.onAppleTap,
  });

  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DividerRow(),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _SocialButton(
                onTap: onGoogleTap,
                icon: _GoogleIcon(),
                label: 'Google',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SocialButton(
                onTap: onAppleTap,
                icon: const Icon(Icons.apple, color: Colors.white, size: 20),
                label: 'Apple',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DividerRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.dividerColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR CONTINUE WITH',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Colors.white.withValues(alpha: 0.35),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.dividerColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.icon, required this.label, this.onTap});

  final Widget icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.socialButtonBorder, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Hand-drawn Google "G" colored logo using CustomPaint.
class _GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(20, 20),
      painter: const _GoogleLogoPainter(),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  const _GoogleLogoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;

    // Arc segments: red, blue, yellow, green (approx Google logo quadrants)
    final colors = [
      const Color(0xFF4285F4), // blue (right arc)
      const Color(0xFF34A853), // green (bottom arc)
      const Color(0xFFFBBC05), // yellow (bottom-left arc)
      const Color(0xFFEA4335), // red (top arc)
    ];
    final startAngles = [-0.35, 1.1, 2.45, 3.7];
    final sweepAngles = [1.5, 1.35, 1.3, 1.25];

    for (int i = 0; i < 4; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.17
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: r * 0.72),
        startAngles[i],
        sweepAngles[i],
        false,
        paint,
      );
    }

    // White bar to create the "G" cutout into the right arc
    final cutPaint = Paint()
      ..color = AppColors.inputBackground
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.32
      ..strokeCap = StrokeCap.butt;

    canvas.drawLine(
      Offset(cx, cy),
      Offset(cx + r * 0.82, cy),
      cutPaint,
    );

    // Solid blue horizontal bar (the G cross bar)
    final barPaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.17
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(cx + r * 0.18, cy),
      Offset(cx + r * 0.82, cy),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
