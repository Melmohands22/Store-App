class RecommendedProductModel {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  RecommendedProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory RecommendedProductModel.fromJson(Map<String, dynamic> jsonData) {
    return RecommendedProductModel(
      id: jsonData['id'] ?? 0,
      price: jsonData['price'] is int ? (jsonData['price'] as int).toDouble() : jsonData['price'],
      oldPrice: jsonData['old_price'] is int ? (jsonData['old_price'] as int).toDouble() : jsonData['old_price'],
      discount: jsonData['discount'] ?? 0,
      image: jsonData['image'] ?? '',
      name: jsonData['name'] ?? '',
      description: jsonData['description'] ?? '',
      images: jsonData['images'] != null ? List<String>.from(jsonData['images']) : [],
      inFavorites: jsonData['in_favorites'] ?? false,
      inCart: jsonData['in_cart'] ?? false,
    );
  }
}
