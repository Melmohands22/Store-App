import 'package:flutter/material.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/views/searchView.dart';
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
        FavoriteView.id: (context) => FavoriteView(),
        HomeView.id: (context) => HomeView(),
        SearchView.id: (context) => SearchView(),
        UpdateProductView.id: (context) => UpdateProductView(),
      },
      initialRoute: HomeView.id,
    );
  }
}
