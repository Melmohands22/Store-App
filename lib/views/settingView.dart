import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:store_app/main.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/views/shopingView.dart';

class SettinView extends StatefulWidget {
  const SettinView({super.key});
  static String id = 'SettinView';
  @override
  State<SettinView> createState() => _SettinViewState();
}

class _SettinViewState extends State<SettinView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
