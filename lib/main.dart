import 'package:flutter/material.dart';
import 'package:store_app/views/categoryView.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/views/on_BoardingView.dart';
import 'package:store_app/views/productView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/views/settingView.dart';
import 'package:store_app/views/shopingView.dart';
import 'package:store_app/views/splashScreen.dart';
import 'package:store_app/views/updateProductView.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnBoardingView.id: (context) => OnBoardingView(),
        CategoryView.id: (context) => CategoryView(),
        ProductView.id: (context) => ProductView(),
        SettinView.id: (context) => SettinView(),
        ShopingView.id: (context) => ShopingView(),
        SplashScreen.id: (context) => SplashScreen(),
        FavoriteView.id: (context) => FavoriteView(),
        HomeView.id: (context) => HomeView(),
        SearchView.id: (context) => SearchView(),
        UpdateProductView.id: (context) => UpdateProductView(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
