import 'package:flutter/material.dart';
import '../models/recommended_Model.dart';
import '../views/recommended _ProductView.dart';

class RecommendedCard extends StatelessWidget {
   RecommendedProductModel recommendProduct;

   RecommendedCard({
    Key? key,
    required this.recommendProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double discountedPrice = recommendProduct.price * 0.60;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RecommendedProductView.id,
          arguments: recommendProduct,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 200,
              maxHeight: 300,
            ),
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendProduct.name.substring(0, 8),
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${discountedPrice.toStringAsFixed(2)}  ',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                        Column(
                          children: [
                            Text(
                              r'$' '${recommendProduct.price.toString()}',
                              style: TextStyle(
                                fontSize:12,
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
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -40,
            child: SizedBox(
              width: 110,
              height: 100,
              child: Image.network(
                recommendProduct.image,
                fit: BoxFit.cover, // Ensure the image fits within constraints
              ),
            ),
          )
        ],
      ),
    );
  }
}
