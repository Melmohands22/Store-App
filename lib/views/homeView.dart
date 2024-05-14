import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/services/getAllProductService.dart';
import 'package:store_app/views/favoriteView.dart';
import 'package:store_app/views/searchView.dart';
import 'package:store_app/widgets/customCard.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
            )
          ],
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
    );
  }
}
