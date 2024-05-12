import 'package:store_app/helper/apiClass.dart';
import 'package:store_app/models/productModel.dart';

class UpdataProduct {
  Future<ProductModel> updataProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Future data = Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return ProductModel.fromJson(data);
  }
}
