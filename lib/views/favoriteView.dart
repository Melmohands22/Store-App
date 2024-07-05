import 'package:flutter/material.dart';


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
