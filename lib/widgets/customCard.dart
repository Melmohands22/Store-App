import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                offset: Offset(1, 1),
                spreadRadius: 0,
                color: Colors.grey.withOpacity(0.1))
          ]),
          child: Card(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'mohamed elmo',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$220',
                          style: TextStyle(fontSize: 18, color: Colors.black),
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
        ),
        Positioned(
          right: 32,
          top: -80,
          child: Image.network(
            'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
            height: 100,
          ),
        )
      ],
    );
  }
}
