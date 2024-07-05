import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = 'SearchView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.orange),
              suffix: Container(child: Text('Search'), color: Colors.orange),
              hintText: 'Search',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange))),
        ),
      ),
    );
  }
}
