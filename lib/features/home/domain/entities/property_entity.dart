/// Domain Entity — no Flutter/JSON dependency.
class PropertyEntity {
  final String id;
  final String title;
  final double price;
  final String location;
  final double rating;
  final int beds;
  final int baths;
  final int sqft;
  final String assetPath;
  final bool isFavorite;

  const PropertyEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.location,
    required this.rating,
    required this.beds,
    required this.baths,
    required this.sqft,
    required this.assetPath,
    required this.isFavorite,
  });

  PropertyEntity copyWith({bool? isFavorite}) => PropertyEntity(
    id: id,
    title: title,
    price: price,
    location: location,
    rating: rating,
    beds: beds,
    baths: baths,
    sqft: sqft,
    assetPath: assetPath,
    isFavorite: isFavorite ?? this.isFavorite,
  );
}
