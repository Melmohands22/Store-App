import 'package:store_app/helper/apiClass.dart';
import 'package:store_app/models/productModel.dart';

class CategorySerivce {
  static String baseUrl = 'https://fakestoreapi.com';

  Future<List<dynamic>> getCategory(String CategoryName) async {
    List<dynamic> data =
        await Api().get(Url: '$baseUrl/products/category/$CategoryName');

    List<ProductModel> ProductList = [];
    for (int i = 0; i < data.length; i++) {
      ProductList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return ProductList;
  }
}
