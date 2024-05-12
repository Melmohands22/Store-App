import 'package:store_app/helper/apiClass.dart';

class AllCategorisService {
  static String baseUrl = 'https://fakestoreapi.com';

  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(Url: '$baseUrl/products/categories');
    return data;
  }
}
