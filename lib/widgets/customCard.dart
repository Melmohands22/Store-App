import 'package:flutter/material.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/views/updateProductView.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductView.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  offset: Offset(1, 1),
                  spreadRadius: 20,
                  color: Colors.grey.withOpacity(0.1))
            ]),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 1,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.description.substring(0, 6),
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price.toString()}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Container(
                            height: 23,
                            width: 23,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Positioned(
            right: 32,
            top: -60,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
