import 'package:flutter/material.dart';
import 'package:store_app/models/productModel.dart';

class CustomView extends StatelessWidget {
  CustomView({super.key, required this.product});
  static String id = 'ProductView';
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Image.network(
            product.image,
            height: 300,
            width: 300,
          ),
          Row(
            children: [
              OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    '6 Uk',
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
