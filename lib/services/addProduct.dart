import 'package:http/http.dart' as http;

class AddProduct {
  Future<List<dynamic>> postProduct() async {
    http.Response response =
        await http.post(Uri.parse('https://fakestoreapi.com/products'), body: {
      'title': 'test',
      'price': '13.5',
      'description': 'lorem ipsum set',
      'image': 'https://i.pravatar.cc',
      'category': 'electronic',
    });
    print(response.body);
  }
}
