import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit_State/bottomNavBarState.dart';
import 'package:store_app/cubits/bottomNavBarCubit.dart';
import 'package:store_app/views/profileview.dart';
import 'package:store_app/widgets/allProductListView.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/views/shopingView.dart';
import 'package:store_app/widgets/categoryCard.dart';
import '../widgets/recommended_For_You_ListView.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    SearchView(),
    ShopingView(),
    FavoriteView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
        listener: (BuildContext context, BottomNavBarState state) {},
        builder: (BuildContext context, BottomNavBarState state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: _currentIndex == 0 ? _buildAppBar() : null,
            body: _pages[_currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              index: _currentIndex,
              backgroundColor: Colors.white,
              color: Colors.orange,
              height: 47,
              items: [
                Icon(Icons.home, color: Colors.black, size: 38),
                Icon(Icons.search, color: Colors.black, size: 32),
                Icon(Icons.shopping_cart, color: Colors.black, size: 32),
                Icon(Icons.favorite, color: Colors.black, size: 32),
                Icon(Icons.person, color: Colors.black, size: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
    );
  }
}
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 150.0,
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
                height: 150.0,
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
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w800),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
            child: CategoryCard(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 10), // Add top padding here
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Text(
                'Trend Products',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w800),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.local_fire_department,
                color: Color(0xffB43F3F),
                size: 36,
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 60),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: AllProductListView(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Recommended for you',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w800),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: RecommendedForYouListview(),
        ),
      ],
    );
  }
}
