import 'package:flutter/material.dart';
import '../models/recommended_Model.dart';

class FavoriteProvider with ChangeNotifier {
  List<RecommendedProductModel> _favoriteProducts = [];

  List<RecommendedProductModel> get favoriteProducts => _favoriteProducts;

  void addProductToFavorites(RecommendedProductModel product) {
    if (_favoriteProducts.any((item) => item.id == product.id)) {
      return;
    }
    _favoriteProducts.add(product);
    notifyListeners();
  }

  bool isProductInFavorites(RecommendedProductModel product) {
    return _favoriteProducts.any((item) => item.id == product.id);
  }
}
