import 'package:flutter/material.dart';
import 'package:store_app/main.dart';

class ShopingView extends StatelessWidget {
  const ShopingView({super.key});
  static String id = 'ShopingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Shoping',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
