import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
          )
        ],
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Fancy Store',
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
              child: const Text(
                'mohamed elmo',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }),
    );
  }
}
