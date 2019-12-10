import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colorList = [
    Colors.green,
    Colors.red,
    Colors.deepOrange,
    Colors.pink,
    Colors.amber
  ];
  Random random = Random();

  Color _getRandomColor() {
    return colorList[random.nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Padding(
          padding: EdgeInsets.all(25),
          child: Container(
              child: Column(
            children: <Widget>[
              _firstPartFavourites(),
              _secondPartFavourites(),
              _separate()
            ],
          )),
        );
      },
      itemCount: 20,
    );
  }

  Widget _firstPartFavourites() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/placeholder_bg.png"),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Micheal Adam",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "12 min -",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Lifestyle",
                        style: TextStyle(
                            color: _getRandomColor(),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        IconButton(
          color: Colors.grey[600],
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
        ),
      ],
    );
  }

  /*************************************************************/

  Widget _secondPartFavourites() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/images/placeholder_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          height: 120,
          width: 120,
          margin: EdgeInsets.only(top: 20),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 15),
            child: Column(
              children: <Widget>[
                Text("What is Lorem Ipsum smamrl intial",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "It is a long established fact that a reader will be distracted byrem Ipsum ",
                  style: TextStyle(
                      color: Colors.grey[700], fontSize: 20, height: 1.25),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  /*********************************/

  Widget _separate() {
    return Container(
      height: 2,
      color: Colors.grey,
      width: double.infinity,
      margin: EdgeInsets.only(top: 50),
    );
  }
}
