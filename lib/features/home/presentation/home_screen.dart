import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';
import 'package:smart_state_app/features/home/data/models/property_model.dart';
import 'package:smart_state_app/features/home/presentation/widgets/filter_section.dart';
import 'package:smart_state_app/features/home/presentation/widgets/header_section.dart';
import 'package:smart_state_app/features/home/presentation/widgets/property_card.dart';

/// Core home screen integrating all sections and the BottomNavigationBar.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  // Navigation items (index → label / icon / badge)
  static const _navItems = [
    _NavItem(label: 'Home', icon: Icons.home_rounded,
        activeIcon: Icons.home_rounded),
    _NavItem(label: 'Discover', icon: Icons.explore_outlined,
        activeIcon: Icons.explore_rounded),
    _NavItem(label: 'Saved', icon: Icons.bookmark_border_rounded,
        activeIcon: Icons.bookmark_rounded),
    _NavItem(label: 'Messages', icon: Icons.chat_bubble_outline_rounded,
        activeIcon: Icons.chat_bubble_rounded, hasBadge: true),
    _NavItem(label: 'Profile', icon: Icons.person_outline_rounded,
        activeIcon: Icons.person_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,

      // ── AppBar ───────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: _AppBarTitle(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.backgroundLight,
              child: const Icon(Icons.person_outline_rounded,
                  color: AppColors.accent, size: 20),
            ),
          ),
        ],
      ),

      // ── Body ────────────────────────────────────────────────
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 8),
          const FilterSection(),
          const SizedBox(height: 20),
          const HeaderSection(),
          const SizedBox(height: 14),
          ...mockProperties.map((p) => PropertyCard(property: p)),
          const SizedBox(height: 8),
        ],
      ),

      // ── Bottom Navigation ────────────────────────────────────
      bottomNavigationBar: _SmartStateBottomNav(
        items: _navItems,
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
      ),
    );
  }
}

// ── AppBar title widget ────────────────────────────────────────────────────────

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 28, height: 28,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Icon(Icons.domain_rounded,
              color: AppColors.backgroundDark, size: 16),
        ),
        const SizedBox(width: 8),
        const Text(
          'Smart State',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

// ── Bottom Navigation Bar ──────────────────────────────────────────────────────

class _NavItem {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  final bool hasBadge;
  const _NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    this.hasBadge = false,
  });
}

class _SmartStateBottomNav extends StatelessWidget {
  final List<_NavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _SmartStateBottomNav({
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        border: Border(top: BorderSide(color: AppColors.cardBorder, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final item = items[i];
          final active = i == currentIndex;
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTap(i),
            child: SizedBox(
              width: 56,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          active ? item.activeIcon : item.icon,
                          key: ValueKey(active),
                          color: active
                              ? AppColors.accent
                              : AppColors.textTertiary,
                          size: 22,
                        ),
                      ),
                      if (item.hasBadge)
                        Positioned(
                          top: -3, right: -3,
                          child: Container(
                            width: 8, height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      color: active
                          ? AppColors.accent
                          : AppColors.textTertiary,
                      fontSize: 10,
                      fontWeight: active
                          ? FontWeight.w700
                          : FontWeight.w400,
                    ),
                    child: Text(item.label),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
