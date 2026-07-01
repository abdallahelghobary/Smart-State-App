import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';
import 'package:smart_state_app/features/splash/widgets/splash_branding_section.dart';
import 'package:smart_state_app/features/splash/widgets/splash_progress_section.dart';
import 'package:smart_state_app/features/splash/widgets/splash_security_section.dart';

/// Splash screen with animated initialization progress and custom tech-grid background.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.onInitializationComplete});

  final VoidCallback? onInitializationComplete;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  String _statusText = 'System initializing...';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _progressAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );

    _controller.addListener(() {
      final val = _controller.value;
      setState(() {
        if (val < 0.25) {
          _statusText = 'System initializing...';
        } else if (val < 0.55) {
          _statusText = 'Establishing secure connection...';
        } else if (val < 0.80) {
          _statusText = 'Loading database modules...';
        } else {
          _statusText = 'Finalizing connection...';
        }
      });
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future<void>.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            widget.onInitializationComplete?.call();
          }
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      // 1. قمنا بتوحيد لون الـ Scaffold الأساسي ليتطابق تماماً مع لون الرسام
      backgroundColor: const Color(0xFF0B1718),
      body: CustomPaint(
        size: Size(size.width, size.height),
        painter: const SplashBackgroundPainter(),
        // 2. جعلنا الـ SafeArea يلتف حول المحتوى فقط، حتى يتمدد الـ CustomPaint خلف الحواف بحرية
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final padding = _responsivePadding(constraints);
              return Padding(
                padding: padding,
                child: AnimatedBuilder(
                  animation: _progressAnimation,
                  builder: (context, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        const SplashBrandingSection(),
                        SizedBox(
                          width: constraints.maxWidth * 0.78,
                          child: SplashProgressSection(
                            statusText: _statusText,
                            progress: _progressAnimation.value,
                          ),
                        ),
                        const SplashSecuritySection(),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  EdgeInsets _responsivePadding(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final horizontal = width * 0.08;
    final vertical = height * 0.04;
    return EdgeInsets.symmetric(
      horizontal: horizontal.clamp(16.0, 48.0),
      vertical: vertical.clamp(12.0, 32.0),
    );
  }
}

/// Custom painter to draw the tech-grid background with soft glowing radial gradients.
class SplashBackgroundPainter extends CustomPainter {
  const SplashBackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Solid background base (very dark slate-teal color matching Figma)
    final bgPaint = Paint()..color = const Color(0xFF0B1718);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // 2. Glowing radial circles
    // Top-left soft glow
    _drawGlow(
      canvas,
      Offset(size.width * 0.15, size.height * 0.15),
      size.width * 0.6,
      AppColors.accent.withValues(alpha: 0.14),
    );
    // Center glow (behind logo)
    _drawGlow(
      canvas,
      Offset(size.width * 0.5, size.height * 0.40),
      size.width * 0.7,
      AppColors.accent.withValues(alpha: 0.08),
    );
    // Bottom-right soft glow
    _drawGlow(
      canvas,
      Offset(size.width * 0.85, size.height * 0.85),
      size.width * 0.8,
      AppColors.accent.withValues(alpha: 0.12),
    );

    // 3. Technical grid pattern of fine horizontal and vertical lines
    final gridPaint = Paint()
      ..color = AppColors.accent.withValues(alpha: 0.025)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const double step = 45.0; // Size of each grid square

    // Draw vertical lines
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  void _drawGlow(Canvas canvas, Offset center, double radius, Color color) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color, color.withValues(alpha: 0.0)],
        stops: const [0.0, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
