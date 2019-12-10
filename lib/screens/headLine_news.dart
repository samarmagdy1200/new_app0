import 'package:flutter/material.dart';
import 'package:new_app/shared_ui/navigation_drawer.dart';
import 'tab_screens/whatsNew.dart';
import 'tab_screens/popular.dart';
import 'tab_screens/favourites.dart';
class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with TickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("HeadLine News"),
          centerTitle: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
          ],
          bottom:TabBar(
            indicatorColor: Colors.white,
            tabs:[
              Tab( text: "WHAT'S NEW"),
              Tab( text: "POPULAR"),
              Tab( text: "FAVOURITES"),

            ],
            controller: _tabController,

          ),
        ),

        drawer: NavigationDrawer(),

        body:Center(
            child:TabBarView(children: [
              WhatsNew(),
              Popular(),
              Favourites(),
            ],
                controller:_tabController)
        )
    );
  }
}
