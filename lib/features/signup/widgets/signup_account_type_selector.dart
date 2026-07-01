import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Large card-style account type selector used on the Create Account screen.
/// The active tab has a solid teal fill; inactive has a dark card with border.
class SignupAccountTypeSelector extends StatelessWidget {
  const SignupAccountTypeSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final int selected; // 0 = Student, 1 = Property Owner
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _AccountTypeCard(
          index: 0,
          icon: Icons.school_outlined,
          label: 'Student',
          selected: selected,
          onTap: onChanged,
        ),
        const SizedBox(width: 12),
        _AccountTypeCard(
          index: 1,
          icon: Icons.home_work_outlined,
          label: 'Property Owner',
          selected: selected,
          onTap: onChanged,
        ),
      ],
    );
  }
}

class _AccountTypeCard extends StatelessWidget {
  const _AccountTypeCard({
    required this.index,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final int index;
  final IconData icon;
  final String label;
  final int selected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = selected == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isActive ? AppColors.accent : AppColors.inputBackground,
            borderRadius: BorderRadius.circular(12),
            border: isActive
                ? null
                : Border.all(color: AppColors.inputBorder, width: 1),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.30),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    )
                  ]
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 28,
                color: isActive
                    ? const Color(0xFF0D1F22)
                    : Colors.white.withValues(alpha: 0.55),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isActive
                      ? const Color(0xFF0D1F22)
                      : Colors.white.withValues(alpha: 0.70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
