import 'package:flutter/material.dart';
import '../models/productModel.dart';
import '../models/recommended_Model.dart';

class RecommendedFavoriteProvider with ChangeNotifier {
  List<RecommendedProductModel> _recommendedfavoriteProducts = [];

  List<RecommendedProductModel> get favoriteProducts => _recommendedfavoriteProducts;

  void addRecommendedProductToFavorites(RecommendedProductModel recommendedProduct) {
    if (_recommendedfavoriteProducts.any((item) => item.id == recommendedProduct.id)) {
      return;
    }
    _recommendedfavoriteProducts.add(recommendedProduct);
    notifyListeners();
  }

  bool isRecommendedProductInFavorites(RecommendedProductModel recommendedProduct) {
    return _recommendedfavoriteProducts.any((item) => item.id == recommendedProduct.id);
  }
}


class FavoriteProvider with ChangeNotifier {
  List<ProductModel> _favoriteProducts = [];

  List<ProductModel> get favoriteProducts => _favoriteProducts;

  void addProductToFavorites(ProductModel product) {
    if (_favoriteProducts.any((item) => item.id == product.id)) {
      return;
    }
    _favoriteProducts.add(product);
    notifyListeners();
  }

  bool isProductInFavorites(ProductModel product) {
    return _favoriteProducts.any((item) => item.id == product.id);
  }
}
