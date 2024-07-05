import 'package:store_app/constant/constant.dart';
import 'package:store_app/helper/apiClass.dart';
import 'package:store_app/models/productModel.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
          'token' : token
    }, token: 'token', );

    return ProductModel.fromJson(data);
  }
}
