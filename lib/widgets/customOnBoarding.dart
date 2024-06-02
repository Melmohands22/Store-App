import 'package:flutter/material.dart';

class OnBoard {
  final String image, fText, sText, fDesc, sDesc;

  OnBoard(
      {required this.image,
      required this.fText,
      required this.sText,
      required this.fDesc,
      required this.sDesc});
}

final List<OnBoard> data = [
  OnBoard(
      image: 'assets/images/11.png',
      fText: 'Clothing Discount More',
      sText: ' Than 50,000 Product',
      fDesc: 'Get the best deals on top trends',
      sDesc: 'Your fashion destination at unbeatable prices!'),
  OnBoard(
      image: 'assets/images/12.png',
      fText: 'Online Shopping Grocery',
      sText: '40% Discount',
      fDesc: 'Quality clothing at half the price!',
      sDesc: 'Discover your style from our vast selection!'),
  OnBoard(
      image: 'assets/images/13.png',
      fText: 'Online Shopping Fast',
      sText: 'Delivery ',
      fDesc: 'Affordable fashion at your fingertips!',
      sDesc: 'Your one-stop shop for discounted fashion!')
];

class OnBoardingBuilder extends StatelessWidget {
  const OnBoardingBuilder(
      {super.key,
      required this.image,
      required this.fText,
      required this.sText,
      required this.fDesc,
      required this.sDesc});
  final String image, fText, sText, fDesc, sDesc;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(
            image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            fText,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            sText,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: Text(
            fDesc,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: Text(
            sDesc,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
