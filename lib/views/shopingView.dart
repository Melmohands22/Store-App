import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
class ShopingView extends StatelessWidget {
  const ShopingView({super.key});
  static String id = 'ShopingView';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<RecommendedCartProvider>(context);
    final cartProducts = cartProvider.cartProducts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Shoping',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: cartProducts.isEmpty
          ? Center(child: Text('No Cart products'))
          : ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final product = cartProducts[index];
          return ListTile(
            leading: Image.network(product.image, width: 80, height: 50),
            title: Text(product.name),
            subtitle: Text(product.description.substring(0, 50),),
            trailing: Text(r'$' '${product.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
