import 'package:dio/dio.dart';
import '../models/recommended_Model.dart';

class RecommendedProductService {
  final String baseUrl = 'https://student.valuxapps.com/api/products?category';
  final Dio dio = Dio();

  RecommendedProductService() {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 's0aLQeOslWbjlgrdZAj8OzwsfCcPBuYr61Yokcko0SFdg5MoNzIQFKr74LKwENowOxto8Y';
  }

  Future<List<RecommendedProductModel>> getRecommendedProducts() async {
    try {
      final response = await dio.get(baseUrl);
      print('API Response: ${response.data}');

      if (response.statusCode == 200) {
        var data = response.data;
        print('Response Data Structure: $data');

        if (data['status'] == true && data['data'] != null) {
          var productsData = data['data']['data'];
          print('Products Data: $productsData');

          if (productsData is List) {
            List<RecommendedProductModel> products = productsData.map<RecommendedProductModel>((json) => RecommendedProductModel.fromJson(json)).toList();
            return products;
          } else {
            throw Exception('Products data is not a list');
          }
        } else {
          throw Exception('Invalid status or data');
        }
      } else {
        throw Exception('Failed to load products, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load products: $e');
    }
  }
}
