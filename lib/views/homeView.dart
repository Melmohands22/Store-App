import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit_State/bottomNavBarState.dart';
import 'package:store_app/cubits/bottomNavBarCubit.dart';
import 'package:store_app/widgets/allProductListView.dart';
import 'package:store_app/views/categoryView.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/views/settingView.dart';
import 'package:store_app/views/shopingView.dart';
import 'package:store_app/widgets/categoryCard.dart';

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
              backgroundColor: Colors.transparent,
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
              ),
            ),
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
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CarouselSlider(
                items: [
                  Image.network(
                    'https://student.valuxapps.com/storage/uploads/banners/1689106848R4Nxl.photo_2023-07-11_23-08-19.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://student.valuxapps.com/storage/uploads/banners/1689106932hsRxm.photo_2023-07-11_23-07-53.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://student.valuxapps.com/storage/uploads/banners/1689110348KHwtl.sales-abstract-landing-page-with-photo_52683-28304%20(1)%20(2).png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://student.valuxapps.com/storage/uploads/banners/1689107104Ezc0d.photo_2023-07-11_23-07-59.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                  height: 200.0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayCurve: Curves.easeIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
              ),
            ),
            SliverToBoxAdapter(
              child: CategoryCard(), // Include the CategoryCard widget here
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'All Products',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 10), // Add top padding here
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                  height: 80), // Add spacing between the two SliverToBoxAdapter
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: AllProductListView(),
            ),
          ],
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
        return Center(child: HomeView());
    }
  }
}
