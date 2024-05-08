import 'dart:convert';

import 'package:http/http.dart' as http;

class AllCategorisService {
  static String baseUrl = 'https://fakestoreapi.com';

  Future<List<dynamic>> getAllCategories() async {
    http.Response response =
        await http.get(Uri.parse('$baseUrl/products/categories'));

    List<dynamic> data = jsonDecode(response.body);
    return data;
  }
}
