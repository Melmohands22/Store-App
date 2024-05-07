import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getAllProductService() async {
  var url = Uri.parse("https://fakestoreapi.com/products");
  var response = await http.get(url);
  return jsonDecode(response.body);
}
