import 'package:flutter/material.dart';
import 'package:smart_state_app/core/theme/app_colors.dart';
import 'package:smart_state_app/features/home/domain/entities/property_entity.dart';

/// Displays a single property as a rich card matching the Figma design.
class PropertyCard extends StatefulWidget {
  final PropertyEntity property;
  const PropertyCard({super.key, required this.property});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.property.isFavorite;
  }

  // ── helpers ──────────────────────────────────────────────────
  String get _formattedPrice =>
      '\$${widget.property.price.toStringAsFixed(0).replaceAllMapped(
            RegExp(r'\B(?=(\d{3})+(?!\d))'),
            (m) => ',',
          )}/mo';

  @override
  Widget build(BuildContext context) {
    final p = widget.property;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Image + overlays ──────────────────────────────────
          _ImageSection(assetPath: p.assetPath, rating: p.rating,
              isFavorite: _isFavorite,
              onFavoriteTap: () => setState(() => _isFavorite = !_isFavorite)),

          // ── Info ──────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + price
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(p.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(width: 8),
                    Text(_formattedPrice,
                        style: const TextStyle(
                            color: AppColors.accent,
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ],
                ),

                const SizedBox(height: 4),

                // Location
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        color: AppColors.accent, size: 13),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(p.location,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.textTertiary, fontSize: 11)),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Amenities
                _AmenitiesRow(beds: p.beds, baths: p.baths, sqft: p.sqft),

                const SizedBox(height: 12),

                // View Details button
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.accent),
                      foregroundColor: AppColors.accent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('View Details',
                        style: TextStyle(fontSize: 13,
                            fontWeight: FontWeight.w600)),
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Sub-widgets ────────────────────────────────────────────────────────────────

class _ImageSection extends StatelessWidget {
  final String assetPath;
  final double rating;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const _ImageSection({
    required this.assetPath,
    required this.rating,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Stack(
        children: [
          // Property image
          Image.asset(
            assetPath,
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              height: 180,
              color: AppColors.backgroundLight,
              child: const Center(
                  child: Icon(Icons.home_work_outlined,
                      color: AppColors.textTertiary, size: 48)),
            ),
          ),

          // Gradient overlay (bottom)
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xCC0D1F22)],
                ),
              ),
            ),
          ),

          // Rating badge (top-left)
          Positioned(
            top: 10, left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xCC0D1F22),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star_rounded,
                      color: Color(0xFFFFC107), size: 13),
                  const SizedBox(width: 3),
                  Text(rating.toStringAsFixed(1),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),

          // Favorite button (top-right)
          Positioned(
            top: 6, right: 6,
            child: GestureDetector(
              onTap: onFavoriteTap,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Icon(
                  isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  key: ValueKey(isFavorite),
                  color: isFavorite ? AppColors.accent : Colors.white,
                  size: 24,
                  shadows: const [
                    Shadow(color: Colors.black54, blurRadius: 6)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmenitiesRow extends StatelessWidget {
  final int beds, baths, sqft;
  const _AmenitiesRow(
      {required this.beds, required this.baths, required this.sqft});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Amenity(icon: Icons.bed_outlined,
            label: '$beds ${beds == 1 ? 'Bed' : 'Beds'}'),
        const _Dot(),
        _Amenity(icon: Icons.bathtub_outlined,
            label: '$baths ${baths == 1 ? 'Bath' : 'Baths'}'),
        const _Dot(),
        _Amenity(icon: Icons.straighten_outlined,
            label: '$sqft sqft'),
      ],
    );
  }
}

class _Amenity extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Amenity({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.accent, size: 14),
        const SizedBox(width: 4),
        Text(label,
            style: const TextStyle(
                color: AppColors.textTertiary,
                fontSize: 11,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Text('·',
          style: TextStyle(color: AppColors.textTertiary, fontSize: 16)),
    );
  }
}
