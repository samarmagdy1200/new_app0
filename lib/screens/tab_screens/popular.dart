import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:new_app/api/posts_api.dart';
import 'dart:async';
import 'package:new_app/models/posts.dart';
import 'package:new_app/screens/single_post.dart';
import 'package:new_app/utilities/data_utilities.dart';



class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsApi postsApi = PostsApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsApi.fetchPostsCategoryId("3"),
      builder: (context, AsyncSnapshot snapShot){

        switch(snapShot.connectionState){
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();

            break;
          case ConnectionState.none:
            return connectionError();
            break;

          case ConnectionState.done:

            if( snapShot.hasError ){
              return error( snapShot.error );
            }else{
              List<Post> posts = snapShot.data;
              return Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: ListView.builder(itemBuilder: (context,position){
                  return Container(
                    color: Colors.grey.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(children: <Widget>[
                          drawCardSection(posts[position]),

                        ]),
                      ],
                    ),
                  );
                },
                  itemCount: posts.length,
                ),
              );

            }

            break;

        }
return null;

      },
    );
  }

  Widget drawCardSection( Post post) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SinglePost(post);
          }));
        },
        child: Card(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image(
                    image: NetworkImage( post.featuredImage),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          post.title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("mohamed amr  "),
                            Row(
                              children: <Widget>[
                                Icon(Icons.timer),
                                Text("19/9/2019"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

}

