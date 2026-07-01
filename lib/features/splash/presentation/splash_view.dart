import 'package:flutter/material.dart';
import 'package:smart_state_app/features/onboarding/presentation/onboarding_view.dart';
import 'package:smart_state_app/features/splash/splash_screen.dart';

/// Splash view controller that initiates the SplashScreen loading sequence
/// and handles the navigation to OnboardingView upon completion.
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      onInitializationComplete: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(builder: (context) => const OnboardingView()),
        );
      },
    );
  }
}
