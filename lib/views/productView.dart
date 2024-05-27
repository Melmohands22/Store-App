// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/widgets/custtomCont.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    Key? key,
  }) : super(key: key);
  static String id = 'ProductView';
  final int orignalPrice = 1500;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.network(
                product.image,
                height: 200,
                width: double.infinity,
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'size 7 UK',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customCont(
                        text: '6 UK',
                        fontWeight: FontWeight.normal,
                        height: 35,
                        width: 54,
                        color: Colors.white),
                    Container(
                      color: Colors.red,
                      width: 54,
                      height: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '7 UK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    customCont(
                        text: '8 UK',
                        fontWeight: FontWeight.normal,
                        height: 35,
                        width: 54,
                        color: Colors.white),
                    customCont(
                        text: '9 UK',
                        fontWeight: FontWeight.normal,
                        height: 35,
                        width: 54,
                        color: Colors.white),
                    customCont(
                        text: '10 UK',
                        fontWeight: FontWeight.normal,
                        height: 35,
                        width: 54,
                        color: Colors.white),
                  ],
                ),
              ),
              Text(
                product.title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: product.rating?.rate,
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                      color: Color(0xffF2C200),
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    product.rating?.count.toString() ??
                        '0', // Convert count to string and handle null
                    style:
                        TextStyle(fontSize: 16), // Adjust text style as needed
                  ),
                ],
              ),
              Row(
                children: [
                  Text(r'$1500  ',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      )),
                  Text(
                    r'$' '${product.price.toString()}  ',
                  ),
                  Text(
                    '40% off',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              Text('Product Delaites',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              SizedBox(
                height: 5,
              ),
              Text(product.description, style: TextStyle(color: Colors.grey)),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Add To Card',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.red)),
                  ),
                  Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Add To Favorite',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}
// void DiscountNum  {

// }