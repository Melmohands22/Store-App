import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/widgets/custtomCont.dart';

class ProductView extends StatefulWidget {
  const ProductView({
    Key? key,
  }) : super(key: key);

  static String id = 'ProductView';

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    final double discountedPrice = product.price * 0.60;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      product.image,
                      height: 200,
                      width: double.infinity,
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: SmoothPageIndicator(
                  controller: pageController, // Assign the PageController here
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.red,
                    dotColor: Colors.grey.shade400,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Size 7 UK',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const customCont(
                      text: '6 UK',
                      height: 35,
                      width: 54,
                      color: Colors.white,
                    ),
                    Container(
                      color: Colors.red,
                      width: 54,
                      height: 35,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '7 UK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const customCont(
                      text: '8 UK',
                      height: 35,
                      width: 54,
                      color: Colors.white,
                    ),
                    const customCont(
                      text: '9 UK',
                      height: 35,
                      width: 54,
                      color: Colors.white,
                    ),
                    const customCont(
                      text: '10 UK',
                      height: 35,
                      width: 55,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Text(
                product.title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: product.rating?.rate ?? 0.0,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_rounded,
                      color: Color(0xffF2C200),
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    product.rating?.count.toString() ?? '0',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    r'$' '${product.price.toStringAsFixed(2)}  ',
                    style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    r'$' '${discountedPrice.toStringAsFixed(2)}  ',
                    style: const TextStyle(color: Colors.black),
                  ),
                  const Text(
                    '40% off',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              const Text(
                'Product Details',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.description,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.red),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, FavoriteView.id,
                          arguments: product);
                    },
                    child: Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Add To Favorite',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
