import 'package:flutter/material.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/views/searchView.dart';
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
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(HomeView.id);
                  },
                  child: Icon(Icons.home)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SearchView.id);
                  },
                  child: Icon(Icons.search)),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(FavoriteView.id);
                  },
                  child: Icon(Icons.favorite)),
              label: 'Favorite',
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
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
