import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';
import 'package:smart_state_app/features/login/presentation/login_screen.dart';
import 'package:smart_state_app/features/onboarding/widgets/onboarding_content_section.dart';
import 'package:smart_state_app/features/onboarding/widgets/onboarding_footer.dart';
import 'package:smart_state_app/features/onboarding/widgets/onboarding_header.dart';
import 'package:smart_state_app/features/onboarding/widgets/onboarding_hero_section.dart';

/// Onboarding screen matching Figma Smart State 1 (node 1-39).
class OnboardingView extends StatefulWidget {
  const OnboardingView({
    super.key,
    this.imageUrl,
    this.imageAsset,
    this.onSkip,
    this.onComplete,
  });

  final String? imageUrl;
  final String? imageAsset;
  final VoidCallback? onSkip;
  final VoidCallback? onComplete;

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  static const _pages = [
    _OnboardingPage(
      title: 'Find student housing',
      description:
          'Discover the best apartments near your university with verified '
          'listings and neighborhood guides.',
      imageAsset: 'assets/images/badRoom.png',
    ),
  ];

  int _currentIndex = 0;

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      setState(() => _currentIndex++);
    } else if (widget.onComplete != null) {
      widget.onComplete!();
    } else {
      // Default: navigate to login screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentIndex];
    final isLastPage = _currentIndex >= _pages.length - 1;

    return Scaffold(
      backgroundColor: AppColors.backgroundOnboarding,
      body: SafeArea(
        child: Column(
          children: [
            OnboardingHeader(onSkip: widget.onSkip),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OnboardingHeroSection(
                      imageUrl: widget.imageUrl,
                      imageAsset: page.imageAsset ?? widget.imageAsset,
                    ),
                    OnboardingContentSection(
                      title: page.title,
                      description: page.description,
                    ),
                  ],
                ),
              ),
            ),
            OnboardingFooter(
              onNext: _onNext,
              nextLabel: isLastPage ? 'Get Started' : 'Next',
              showStepCards: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage {
  const _OnboardingPage({
    required this.title,
    required this.description,
    this.imageAsset,
  });

  final String title;
  final String description;
  final String? imageAsset;
}
