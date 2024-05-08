class ProductModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String price;
  final RatingModel rating;
  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        description: jsonData['description'],
        image: jsonData['image'],
        price: jsonData['price'],
        rating: RatingModel.fromjson(jsonData['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromjson(jsonData) {
    return RatingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
