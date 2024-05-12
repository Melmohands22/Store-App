import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/helper/apiClass.dart';
import 'package:store_app/models/productModel.dart';

class allProductServic {
  static const String baseUrl = 'https://fakestoreapi.com';
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(Url: '$baseUrl/products');

    List<ProductModel> ProductList = [];
    for (int i = 0; i < data.length; i++) {
      ProductList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return ProductList;
  }
}
