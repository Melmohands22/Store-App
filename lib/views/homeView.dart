import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_app/main.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/services/getAllProductService.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/views/settingView.dart';
import 'package:store_app/views/shopingView.dart';
import 'package:store_app/widgets/customCard.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fancy',
                style: TextStyle(fontSize: 28, color: Colors.black),
              ),
              Text(
                ' Store',
                style: TextStyle(fontSize: 28, color: Colors.orange),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index]);
                  });
            } else {
              return Center(
                child: SpinKitDancingSquare(
                  color: Colors.orange,
                  size: 80,
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.orange,
          height: 47,
          items: [
            Icon(
              Icons.home,
              color: Colors.black,
              size: 38,
            ),
            Icon(Icons.search, color: Colors.black, size: 32),
            Icon(Icons.shopping_cart, color: Colors.black, size: 32),
            Icon(Icons.favorite, color: Colors.black, size: 32),
            Icon(Icons.settings, color: Colors.black, size: 32),
          ]),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeView(),
    SearchView(),
    ShopingView(),
    FavoriteView(),
    SettinView(),
  ];

  Widget _buildNavItem(IconData icon, String label, String routeId) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(routeId);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MainScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.orange,
        backgroundColor: Colors.white,
        height: 50,
        animationDuration: Duration(milliseconds: 200),
        items: [
          _buildNavItem(Icons.home, 'Home', HomeView.id),
          _buildNavItem(Icons.search, 'Search', SearchView.id),
          _buildNavItem(Icons.shopping_cart, 'Shopping', ShopingView.id),
          _buildNavItem(Icons.favorite, 'Favorites', FavoriteView.id),
          _buildNavItem(Icons.settings, 'Settings', SettinView.id),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
