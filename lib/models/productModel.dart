// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String title;
  String description;
  String image;
  double price;
  ProductModel({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        title: jsonData['title'],
        description: jsonData['description'],
        image: jsonData['image'],
        price: jsonData['price']);
  }
}
