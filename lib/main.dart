import 'package:flutter/material.dart';
import 'package:store_app/shared/local_network.dart';
import 'package:store_app/views/categoryView.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/views/loginView.dart';
import 'package:store_app/views/on_BoardingView.dart';
import 'package:store_app/views/productView.dart';
import 'package:store_app/views/registerView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/views/profileview.dart';
import 'package:store_app/views/shopingView.dart';
import 'package:store_app/views/splashScreen.dart';
import 'package:store_app/views/updateProductView.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await CacheNetwork.cacheIitialization();
 CacheNetwork.getCacheData(key: 'token');
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
    );
  }
}
