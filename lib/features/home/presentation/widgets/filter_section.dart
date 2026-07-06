import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';

/// Search bar + horizontally scrollable filter chips.
class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  int _activeFilter = 0;
  static const _filters = ['All Areas', 'Price', 'Type', 'Bedrooms'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Search bar ─────────────────────────────────────────
        Container(
          height: 46,
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.inputBorder),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              const Icon(Icons.search, color: AppColors.textTertiary, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Search apartments, areas...',
                    hintStyle: TextStyle(
                        color: AppColors.textTertiary, fontSize: 13),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 30, width: 30,
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.tune_rounded,
                    color: AppColors.accent, size: 17),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // ── Filter chips ───────────────────────────────────────
        SizedBox(
          height: 34,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: _filters.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              final active = i == _activeFilter;
              return GestureDetector(
                onTap: () => setState(() => _activeFilter = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 7),
                  decoration: BoxDecoration(
                    color: active
                        ? AppColors.accent
                        : AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: active
                            ? AppColors.accent
                            : AppColors.inputBorder),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_filters[i],
                          style: TextStyle(
                              color: active
                                  ? AppColors.backgroundDark
                                  : AppColors.textTertiary,
                              fontSize: 12,
                              fontWeight: active
                                  ? FontWeight.w700
                                  : FontWeight.w500)),
                      if (!active) ...[
                        const SizedBox(width: 4),
                        const Icon(Icons.keyboard_arrow_down_rounded,
                            color: AppColors.textTertiary, size: 14),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
