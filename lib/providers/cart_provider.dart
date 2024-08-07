import 'package:flutter/material.dart';
import '../models/recommended_Model.dart';

class RecommendedCartProvider with ChangeNotifier {
  List<RecommendedProductModel> _recommendedCartProducts = [];

  List<RecommendedProductModel> get cartProducts => _recommendedCartProducts;

  void addRecommendedProductToCart(RecommendedProductModel recommendedProduct) {
    if (_recommendedCartProducts.any((item) => item.id == recommendedProduct.id)) {
      return;
    }
    _recommendedCartProducts.add(recommendedProduct);
    notifyListeners();
  }

  bool isRecommendedProductInCart(RecommendedProductModel recommendedProduct) {
    return _recommendedCartProducts.any((item) => item.id == recommendedProduct.id);
  }
}