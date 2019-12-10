import 'package:flutter/material.dart';
import 'package:new_app/models/posts.dart';
import 'dart:math';
class SinglePost extends StatefulWidget {
  Post post;
  SinglePost(this.post);
  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(

          body: CustomScrollView(
            slivers:<Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.post.featuredImage),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, position){
                  if(position==0){
                    return _drawPostDetails();
                  }
                  else if(position >= 1 && position < 24) {
                    return _comments();
                  }
                  else {
                    return _commentTextEntry();
                  }

                },
                    childCount:25
                ),
              ),
            ],
          ),
        );


  }

  final random = Random();
  Color getRandomColor({int minBrightness = 50}){
    assert(minBrightness >= 0 && minBrightness <= 225);
    return Color.fromARGB(
      0xFF,
    minBrightness + random.nextInt(255 - minBrightness),
    minBrightness + random.nextInt(255 - minBrightness),
    minBrightness + random.nextInt(255 - minBrightness),


    );
  }
  Widget _drawPostDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text( widget.post.content, style: TextStyle(
          fontSize: 18,
          letterSpacing: 1.2,
          height: 1.25
      ),),
    );
  }

  Widget _comments() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column (
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/placeholder.png"),
              ),
              SizedBox(
                width: 16 ,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Crstina"),
                  Text("1 hours")
                ],
              )



            ]
          ),

          SizedBox(
            height: 16,
          ),
          Text("Write comment here Write comment here Write comment here")
        ],
  ),
    );
  }

  Widget _commentTextEntry() {
    return Container(
        color:Color.fromRGBO(241, 245, 247, 1),
        child: Row(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write comment here!',

                ),
              ),
            ),
          ),
          FlatButton(
            child: Text("send",style: TextStyle(color: Colors.red),),
          )
        ],
      ),
    );
  }
}
