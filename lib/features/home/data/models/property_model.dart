import '../../domain/entities/property_entity.dart';

/// Data Model — extends the entity and adds JSON serialization.
class PropertyModel extends PropertyEntity {
  const PropertyModel({
    required super.id,
    required super.title,
    required super.price,
    required super.location,
    required super.rating,
    required super.beds,
    required super.baths,
    required super.sqft,
    required super.assetPath,
    required super.isFavorite,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
    id: json['id'] as String,
    title: json['title'] as String,
    price: (json['price'] as num).toDouble(),
    location: json['location'] as String,
    rating: (json['rating'] as num).toDouble(),
    beds: json['beds'] as int,
    baths: json['baths'] as int,
    sqft: json['sqft'] as int,
    assetPath: json['assetPath'] as String,
    isFavorite: json['isFavorite'] as bool? ?? false,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'location': location,
    'rating': rating,
    'beds': beds,
    'baths': baths,
    'sqft': sqft,
    'assetPath': assetPath,
    'isFavorite': isFavorite,
  };
}

/// Hardcoded mock data matching the Figma screenshot.
final List<PropertyModel> mockProperties = [
  const PropertyModel(
    id: '1',
    title: 'Downtown Modern Loft',
    price: 2500,
    location: 'Central District, Metropolis',
    rating: 4.9,
    beds: 3,
    baths: 2,
    sqft: 1200,
    assetPath: 'assets/images/modern_loft.jpg',
    isFavorite: false,
  ),
  const PropertyModel(
    id: '2',
    title: 'Azure Waterfront Villa',
    price: 4200,
    location: 'Seaside Cove, North Bay',
    rating: 4.8,
    beds: 4,
    baths: 3,
    sqft: 2150,
    assetPath: 'assets/images/waterfront_villa.jpg',
    isFavorite: false,
  ),
  const PropertyModel(
    id: '3',
    title: 'Echo Park Smart Studio',
    price: 1850,
    location: 'Echo Park, Downtown',
    rating: 4.7,
    beds: 1,
    baths: 1,
    sqft: 650,
    assetPath: 'assets/images/studio.jpg',
    isFavorite: false,
  ),
];
