import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({
    super.key,
  });
  static String id = 'FavoriteView';

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<RecommendedFavoriteProvider>(context);
    final favoriteProducts = favoriteProvider.favoriteProducts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: favoriteProducts.isEmpty
          ? Center(child: Text('No favorite products'))
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
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
