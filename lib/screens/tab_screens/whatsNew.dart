import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_app/api/posts_api.dart';
import 'dart:async';
import 'package:new_app/models/posts.dart';
import 'package:new_app/utilities/data_utilities.dart';
import 'dart:math';
import 'package:new_app/screens/single_post.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsApi postsApi = PostsApi();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
          _recentUpdate(),
        ],
      ),
    );
  }

/*****************************************************************/

  Widget _drawHeader() {
    TextStyle headerTitle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    TextStyle headerDescription = TextStyle(
      fontSize: 20,
      color: Colors.white,
    );
    return FutureBuilder(
        future: postsApi.fetchPostsCategoryId("1"),
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
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
              if (snapShot.error != null) {
                return error(snapShot.error);
              } else {
                List<Post> posts = snapShot.data;
                Random random = Random();
                int randomIndex = random.nextInt(posts.length);
                Post post = posts[randomIndex];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SinglePost(post);
                    }));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(post.featuredImage),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                post.title,
                                style: headerTitle,
                                textAlign: TextAlign.center,
                              )),
                          Text(
                            post.content.substring(0, 75),
                            style: headerDescription,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              break;
          }
          return null;
        });
  }

  /**********************************************************************/

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _titleAll("Top Stories"),
          FutureBuilder(
            future: postsApi.fetchPostsCategoryId("1"),
            builder: (context, AsyncSnapshot snapShot) {
              switch (snapShot.connectionState) {
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
                  if (snapShot.error != null) {
                    return error(snapShot.error);
                  } else {
                    if (snapShot.hasData) {
                      List<Post> posts = snapShot.data;
                      if (posts.length >= 3) {
                        Post post1 = snapShot.data[0];
                        Post post2 = snapShot.data[1];
                        Post post3 = snapShot.data[2];

                        return Column(
                          children: <Widget>[
                            drawCardSection(post1),
                            drawCardSection(post2),
                            drawCardSection(post3),
                          ],

                          // ignore: missing_return, missing_return
                        );
                      } else {
                        return noData();
                      }
                    } else {
                      return noData();
                    }
                  }
                  break;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _titleAll(title) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 16, bottom: 11),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }

  Widget drawCardSection(Post post) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context){
            return SinglePost(post);
          }
        )
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Card(
            child: Row(
          children: <Widget>[
            SizedBox(
              width: 120,
              height: 120,
              child: Image.network(
                post.featuredImage,
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
                    /* Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("mohamed amr  "),
                        Row(
                          children: <Widget>[
                            Icon(Icons.timer),
                            Flexible(child: Text("18.8")),
                          ],
                        )
                      ],
                    )*/
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  /**********************************************************************/

  Widget _recentUpdate() {
    return FutureBuilder(
      future: postsApi.fetchPostsCategoryId("2"),
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
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
            if (snapShot.hasError) {
              return error(snapShot.error);
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _titleAll("Recent Updates"),
                  _recentUpdateSection(Colors.green, snapShot.data[0]),
                  _recentUpdateSection(Colors.red, snapShot.data[1]),
                ],
              );
            }
            break;
        }

        return null;
      },
    );
  }

  Widget _recentUpdateSection(color, Post post) {
    return Card(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SinglePost(post);
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(post.featuredImage),
                fit: BoxFit.cover,
              )),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 33, left: 33, top: 6, bottom: 6),
                  child: Text(
                    "SPORT",
                    style: TextStyle(
                        color: Colors.white, letterSpacing: 1, fontSize: 15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      post.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          color: Colors.grey[500],
                        ),
                        Text(
                          "18.8",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
