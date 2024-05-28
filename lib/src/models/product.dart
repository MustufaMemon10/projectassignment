

class ProductModel {
  final int id;
  final String category;
  final String title;
  final String brand;
  final String description;
  final double rating;
  final double price;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.category,
    required this.title,
    required this.brand,
    required this.description,
    required this.rating,
    required this.price,
    required this.imageUrl,
  });

  /// Helper Function
  static ProductModel empty() => ProductModel(
        id: 0,
        category: '',
        brand: '',
        title: '',
        description: '',
        rating : 0,
        price: 0,
        imageUrl: '',
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'] ?? 0,
        category: json['category'] ?? '',
        title: json['title'] ?? '',
        brand: json['brand'] ?? '',
        description: json['description'] ?? '',
        rating: (json['rating'] != null) ? json['rating'].toDouble() : 0.0,
        price: (json['price'] != null) ? json['price'].toDouble() : 0.0,
        imageUrl: json['thumbnail'] ?? ''
    );
  }
}
