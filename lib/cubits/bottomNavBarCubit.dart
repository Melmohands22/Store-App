import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit_State/bottomNavBarState.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/views/shopingView.dart';

import '../views/profileview.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState(0));

  static BottomNavBarCubit get(BuildContext context) =>
      BlocProvider.of<BottomNavBarCubit>(context);

  int currentIndex = 0;

  List<Widget> screens = [
    HomeView(),
    SearchView(),
    ShopingView(),
    FavoriteView(),
    ProfileView(),
  ];

  void changeIndex(int newIndex) {
    emit(BottomNavBarState(newIndex));
  }
}
