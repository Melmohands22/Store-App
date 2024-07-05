import 'package:store_app/helper/apiClass.dart';
import 'package:store_app/models/productModel.dart';

class AllCategoriesService {
  Future<List<ProductModel>> getAllCategories(String categoryName) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName', token: 'token');

    // Convert the dynamic data to List<ProductModel>
    List<ProductModel> products =
        data.map((item) => ProductModel.fromJson(item)).toList();

    return products;
  }
}
