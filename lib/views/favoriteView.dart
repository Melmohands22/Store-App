import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:store_app/main.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/views/settingView.dart';
import 'package:store_app/views/shopingView.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  static String id = 'FavoriteView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
