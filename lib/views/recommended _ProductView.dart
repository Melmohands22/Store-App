import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/recommended_Model.dart';
import '../providers/cart_provider.dart';
import '../providers/favorite_provider.dart';
import '../widgets/custtomCont.dart';

class RecommendedProductView extends StatefulWidget {
  const RecommendedProductView({Key? key}) : super(key: key);

  static String id = 'RecommendedProductView';

  @override
  State<RecommendedProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<RecommendedProductView> {
  final PageController pageController = PageController();

  void showCustomDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final recommendedProduct = ModalRoute.of(context)!.settings.arguments as RecommendedProductModel?;

    if (recommendedProduct == null) {
      // Handle the null case
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product View'),
        ),
        body: const Center(
          child: Text('No product data available.'),
        ),
      );
    }

    final double discountedPrice = recommendedProduct.price * 0.60;

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
                  itemCount: 3, // Adjust based on actual image count
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      recommendedProduct.image,
                      height: 200,
                      width: double.infinity,
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
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
                recommendedProduct.name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Row(
                children: [],
              ),
              Row(
                children: [
                  Text(
                    r'$' '${recommendedProduct.price.toStringAsFixed(2)}  ',
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
                recommendedProduct.description,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      final cartProvider = Provider.of<RecommendedCartProvider>(context, listen: false);
                      if (cartProvider.isRecommendedProductInCart(recommendedProduct)) {
                        showCustomDialog(context, 'Product is already in cart!');
                      } else {
                        cartProvider.addRecommendedProductToCart(recommendedProduct);
                        showCustomDialog(context, 'Product added to cart!');
                      }
                    },
                    child: Container( decoration: BoxDecoration(
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
                  ),

                  GestureDetector(
                    onTap: () {
                      final favoriteProvider = Provider.of<RecommendedFavoriteProvider>(context, listen: false);
                      if (favoriteProvider.isRecommendedProductInFavorites(recommendedProduct)) {
                        showCustomDialog(context, 'Product is already in Favorite!');
                      } else {
                        favoriteProvider.addRecommendedProductToFavorites(recommendedProduct);
                        showCustomDialog(context, 'Product added to Favorite!');
                      }
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
