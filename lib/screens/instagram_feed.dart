import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:new_app/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  List<int> ids = [0 , 2 , 7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instagram Feeds"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ]),
      drawer: NavigationDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _drawHeader(position),
                    _drawTitle(),
                    _drawHashTags(),
                    _drawBody(),
                    _drawFooter(),
                  ],
                ),
              ),
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }

  Widget _drawHeader(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Charistina Meyars",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text("Fri, 12 May 2017 . 14.30",
                    style: TextStyle(color: Colors.grey, fontSize: 16))
              ],
            )
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: (){
                if(ids.contains(position)){
                  ids.remove(position);
                }
                else{
                  ids.add(position);
                }
                setState((){

                });
                print(ids);
              },
              color: (ids.contains(position))? Colors.red : Colors.grey.shade400,
            ),
            Transform.translate(
              offset: Offset(-12,0),
                child: Text("25", style: TextStyle(color: Colors.grey.shade500),))
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 15,right: 15,bottom: 15,),
      child: Text(
          "It is a long established fact that a reader will be distracted byrem Ipsum",
        style: TextStyle(
          color: Colors.grey.shade900,
          height: 1.5,
          fontSize: 15
        ),
      ),
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(onPressed: (){}, child: Text("#advance", style:TextStyle(color: Colors.orange),),),
          FlatButton(onPressed: (){}, child: Text("#advance", style:TextStyle(color: Colors.orange),),),
          FlatButton(onPressed: (){}, child: Text("#advance", style:TextStyle(color: Colors.orange),),)



        ],

      ),
    );
  }

  Widget _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.25,
      child: Image(
        image:ExactAssetImage("assets/images/placeholder_bg.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawFooter() {
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          onPressed:(){},
          child: Text("10 OMMENTS",
            style:TextStyle(color: Colors.orange,
            ),
          ),
        ),
       Row(
         children: <Widget>[
           FlatButton(
             onPressed:(){},
             child: Text("SHARE",
               style:TextStyle(color: Colors.orange,
               ),
             ),
           ),
           FlatButton(
             onPressed:(){},
             child: Text("OPEN",
               style:TextStyle(color: Colors.orange,
               ),
             ),
           ),
         ],
       )
      ],


    );
  }
}
