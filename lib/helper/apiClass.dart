import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String Url}) async {
    http.Response response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('there was an error ${response.statusCode}');
    }
  }
}
