import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Hero image with rounded corners and teal overlay (Figma Illustration/Hero).
class OnboardingHeroSection extends StatelessWidget {
  const OnboardingHeroSection({super.key, this.imageUrl, this.imageAsset});

  final String? imageUrl;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = (width * 0.04).clamp(16.0, 16.0);
    final height = (MediaQuery.sizeOf(context).height * 0.34).clamp(
      280.0,
      320.0,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal, 16, horizontal, 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: _buildImage(),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (imageAsset != null && imageAsset!.isNotEmpty) {
      return Image.asset(
        imageAsset!,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _placeholder(),
      );
    }
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _placeholder(),
      );
    }
    return _placeholder();
  }

  Widget _placeholder() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.heroCardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Icon(
          Icons.bed_outlined,
          size: 88,
          color: AppColors.onboardingAccent,
        ),
      ),
    );
  }
}
