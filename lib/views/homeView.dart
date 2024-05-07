import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              height: 130,
              width: 220,
              child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 74,
                        ),
                        Text(
                          'mohamed elmo',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'$220',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.solidHeart,
                                  color: Colors.red,
                                ))
                          ],
                        )
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
