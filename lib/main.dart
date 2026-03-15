import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_theme.dart';
import 'package:smart_state_app/features/splash/presentation/splash_view.dart';

void main() {
  runApp(const SmartState());
}

class SmartState extends StatelessWidget {
  const SmartState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart State',
      theme: AppTheme.light,
      home: const SplashView(),
    );
  }
}
