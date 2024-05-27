import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_app/cubit_State/bottomNavBarState.dart';
import 'package:store_app/cubits/bottomNavBarCubit.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/services/getAllProductService.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/views/settingView.dart';
import 'package:store_app/views/shopingView.dart';
import 'package:store_app/widgets/customCard.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
        listener: (BuildContext context, BottomNavBarState state) {},
        builder: (BuildContext context, BottomNavBarState state) {
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
            body: _buildPageContent(state.currentIndex),
            bottomNavigationBar: CurvedNavigationBar(
                onTap: (index) {
                  BottomNavBarCubit.get(context).changeIndex(index);
                },
                index: state.currentIndex,
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
        },
      ),
    );
  }

  Widget _buildPageContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Padding(
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
        );
      case 1:
        return Center(child: SearchView());
      case 2:
        return Center(child: ShopingView());
      case 3:
        return Center(child: FavoriteView());
      case 4:
        return Center(child: SettinView());
      default:
        return Center(child: Text('Home Page'));
    }
  }
}
