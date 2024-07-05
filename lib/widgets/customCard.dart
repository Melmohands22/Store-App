import 'package:flutter/material.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/views/productView.dart';
class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    final double discountedPrice = product.price * 0.60;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductView.id, arguments: product);
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
                            r'$' '${discountedPrice.toStringAsFixed(2)}  ',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                          Column(
                            children: [
                              Text(
                                r'$' '${product.price.toString()}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const Text(
                                '40% off',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
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
