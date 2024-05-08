import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/productModel.dart';

class allProductServic {
  static const String baseUrl = 'https://fakestoreapi.com';
  Future<List<ProductModel>> getAllProducts() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));

    List<dynamic> data = jsonDecode(response.body);

    List<ProductModel> ProductList = [];
    for (int i = 0; i < data.length; i++) {
      ProductList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return ProductList;
  }
}
