import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/favorite_provider.dart';
import 'package:store_app/shared/local_network.dart';
import 'package:store_app/views/categoryView.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/views/loginView.dart';
import 'package:store_app/views/on_BoardingView.dart';
import 'package:store_app/views/productView.dart';
import 'package:store_app/views/recommended%20_ProductView.dart';
import 'package:store_app/views/registerView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/views/profileview.dart';
import 'package:store_app/views/shopingView.dart';
import 'package:store_app/views/splashScreen.dart';
import 'package:store_app/views/updateProductView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.initializeCache();
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecommendedFavoriteProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => RecommendedCartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          RecommendedProductView.id: (context) => RecommendedProductView(),
          RegisterView.id: (context) => RegisterView(),
          LoginView.id: (context) => LoginView(),
          OnBoardingView.id: (context) => OnBoardingView(),
          CategoryView.id: (context) => CategoryView(),
          ProductView.id: (context) => ProductView(),
          ProfileView.id: (context) => ProfileView(),
          ShopingView.id: (context) => ShopingView(),
          SplashScreen.id: (context) => SplashScreen(),
          FavoriteView.id: (context) => FavoriteView(),
          HomeView.id: (context) => HomeView(),
          SearchView.id: (context) => SearchView(),
          UpdateProductView.id: (context) => UpdateProductView(),
        },
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
