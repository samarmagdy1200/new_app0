import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_app/shared_ui/navigation_drawer.dart';

class TweeterFeed extends StatefulWidget {
  @override
  _TweeterFeedState createState() => _TweeterFeedState();
}

class _TweeterFeedState extends State<TweeterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tweeter Feeds"), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ]),
        drawer: NavigationDrawer(),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(itemBuilder: (context, position) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Card(
                child: Column(
                  children: <Widget>[
                    _cardHeader(),
                    _cardBody(),
                    _drawLine(),
                    _cardFooter()
                  ],
                ),
              ),
            );
          },
            itemCount: 20,

          ),
        ));
  }

  /*************cardHeader***************/
  Widget _cardHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundImage:
                ExactAssetImage("assets/images/pplaceholder_bg.png"),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Charistina Meyars", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                SizedBox(width: 8,),
                Text("@ch_meyers", style:TextStyle(color: Colors.grey, fontSize: 16))],
            ),
            SizedBox(
              height: 8,
            ),
            Text("Fri, 12 May 2017 . 14.30", style:TextStyle(color: Colors.grey, fontSize: 16))
          ],
        )
      ],
    );
  }

  /*************_cardBody***************/

  Widget _cardBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Text('What is Lorem Ipsum smamrl intial Ipsum smamrl intial smamrl intial Ipsum smamrl intial',style:TextStyle(fontSize: 18, height: 1.5, color: Colors.grey.shade900)),
    );
  }

  /*************drawLine***************/

  Widget _drawLine(){
    return Container(
      height: 1,
      color: Colors.grey.shade400,
      margin: EdgeInsets.only(top: 8),

    );
  }

  /*************cardFooter***************/

  Widget _cardFooter() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.repeat, size: 24,),
                color: Colors.orange,
                onPressed: () {},
              ),
              Text("25", style:TextStyle(color: Colors.grey, fontSize: 16), )
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {},
                  child: Text("SHARE", style: TextStyle(color: Colors.orange))),
              FlatButton(
                onPressed: () {},
                child: Text("OPEN", style: TextStyle(color: Colors.orange)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
